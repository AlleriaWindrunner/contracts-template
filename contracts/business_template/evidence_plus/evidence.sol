/*
 * Copyright 2021 LI LI of JINGTIAN & GONGCHENG.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * */

pragma solidity ^0.4.4;

contract EvidenceSignersDataABI
{
	function verify(address addr)public constant returns(bool){}
	function getSigner(uint index)public constant returns(address){} 
	function getSignersSize() public constant returns(uint){}
}

contract Evidence{
    
    string evidence;
    address[] signers;
    address public factoryAddr;
    
    event addSignaturesEvent(string evi);
    event newSignaturesEvent(string evi, address addr);
    event errorNewSignaturesEvent(string evi, address addr);
    event errorAddSignaturesEvent(string evi, address addr);
    event addRepeatSignaturesEvent(string evi);
    event errorRepeatSignaturesEvent(string evi, address addr);

    function CallVerify(address addr) public constant returns(bool) {
        return EvidenceSignersDataABI(factoryAddr).verify(addr);
    }

   constructor(string evi, address addr)  {
       factoryAddr = addr;
       if(CallVerify(tx.origin))
       {
           evidence = evi;
           signers.push(tx.origin);
           newSignaturesEvent(evi,addr);
       }
       else
       {
           errorNewSignaturesEvent(evi,addr);
       }
    }

    function getEvidence() public constant returns(string,address[],address[]){
        uint length = EvidenceSignersDataABI(factoryAddr).getSignersSize();
         address[] memory signerList = new address[](length);
         for(uint i= 0 ;i<length ;i++)
         {
             signerList[i] = (EvidenceSignersDataABI(factoryAddr).getSigner(i));
         }
        return(evidence,signerList,signers);
    }

    function addSignatures() public returns(bool) {
        for(uint i= 0 ;i<signers.length ;i++)
        {
            if(tx.origin == signers[i])
            {
                addRepeatSignaturesEvent(evidence);
                return true;
            }
        }
       if(CallVerify(tx.origin))
       {
            signers.push(tx.origin);
            addSignaturesEvent(evidence);
            return true;
       }
       else
       {
           errorAddSignaturesEvent(evidence,tx.origin);
           return false;
       }
    }
    
    function getSigners()public constant returns(address[])
    {
         uint length = EvidenceSignersDataABI(factoryAddr).getSignersSize();
         address[] memory signerList = new address[](length);
         for(uint i= 0 ;i<length ;i++)
         {
             signerList[i] = (EvidenceSignersDataABI(factoryAddr).getSigner(i));
         }
         return signerList;
    }
}