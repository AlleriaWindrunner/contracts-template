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
import "./Evidence.sol";

contract EvidenceFactory{
        address[] signers;
        
        //advance to add logic about free key
        mapping(string=>address) evi_key; 
        
        event newEvidenceEvent(address addr);
		event newEvidenceEventWithKey(address addr, string key);
		function newEvidence(string evi) public returns(address)
		{
		    Evidence evidence = new Evidence(evi, this);
		    emit newEvidenceEvent(evidence);
		    return evidence;
		}
        function newEvidenceByKey(string evi, string key) public returns(address)
        {
            Evidence evidence = new Evidence(evi, this);
            emit newEvidenceEventWithKey(evidence, key); 
            evi_key[key] = evidence;
            return evidence;
        }
        
        function getEvidenceByKey(string key) public constant returns(string,address[],address[]){ 
            return getEvidence(evi_key[key]);
        }
        
        function getEvidence(address addr) public constant returns(string,address[],address[]){
            return Evidence(addr).getEvidence();
        }

                
        function addSignatures(address addr) public returns(bool) {
            return Evidence(addr).addSignatures();
        }
        
        constructor(address[] evidenceSigners){
            for(uint i=0; i<evidenceSigners.length; ++i) {
                signers.push(evidenceSigners[i]);
			}
		}

        function verify(address addr)public constant returns(bool){
            for(uint i=0; i<signers.length; ++i) {
                if (addr == signers[i])
                {
                    return true;
                }
            }
            return false;
        }

        function getSigner(uint index)public constant returns(address){
            uint listSize = signers.length;
            if(index < listSize)
            {
                return signers[index];
            }
            else
            {
                return 0;
            }
    
        }

        function getSignersSize() public constant returns(uint){
            return signers.length;
        }
    
        function getSigners() public constant returns(address[]){
            return signers;
        }

}