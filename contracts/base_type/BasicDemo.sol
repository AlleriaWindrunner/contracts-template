/*
 * Copyright 2014-2019 the original author or authors.
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


pragma solidity ^0.4.25;
import "./LibAddress.sol";
import "./LibConverter.sol" ;
import "./LibSafeMathForUint256Utils.sol";
contract BasicDemo {

    function safeMathDemo() public view {
        uint256 a =25;
        uint256 b =20;
        // a + b
        uint256 c = LibSafeMathForUint256Utils.add(a,b);
        // a - b
        uint256 d = LibSafeMathForUint256Utils.sub(a,b);
        // a * b
        uint256 e = LibSafeMathForUint256Utils.mul(a,b);
        // a/b
        uint256 f = LibSafeMathForUint256Utils.div(a,b);
    }

    function modPower() public view {
        uint256 a=25;
        uint256 b=20;
        // a % b
        uint256 c = LibSafeMathForUint256Utils.mod(a,b);
        // a ^ b
        uint256 d = LibSafeMathForUint256Utils.power(a,b);
    }

    function convertDemo() public view{
        uint256 a = 25;
        bytes memory b = LibConverter.uintToBytes(a);
    }

    function convertDemo2() public view{
        bytes memory a = "25";
        int b = LibConverter.bytesToInt(a);
    }

    function addressDemo() public view{
        address addr = 0xE0f5206BBD039e7b0592d8918820024e2a7437b9;
        bytes memory bs=LibAddress.addressToBytes(addr);
        bs = new bytes(20);
        addr = LibAddress.bytesToAddress(bs);
        addr = 0xE0f5206BBD039e7b0592d8918820024e2a7437b9;
        string memory addrStr = LibAddress.addressToString(addr);
        string memory str="0xE0f5206BBD039e7b0592d8918820024e2a7437b9";
        addr = LibAddress.stringToAddress(str);
    }
}
