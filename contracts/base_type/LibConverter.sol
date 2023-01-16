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

library LibConverter {
    function toUint128(uint256 value) internal pure returns (uint128) {
        require(value < 2**128, "SafeCast: can not fit in 128 bits");
        return uint128(value);
    }

  
    function toUint8(uint256 value) internal pure returns (uint8) {
        require(value < 2**8, "SafeCast: can not fit in 8 bits");
        return uint8(value);
    }

    function uintToBytes(uint v) internal pure returns (bytes memory) {
        uint maxlength = 100; 
        bytes memory reversed = new bytes(maxlength);
        uint i = 0; 
        while (v != 0) { 
            uint8 remainder = uint8(v % 10); 
            v = v / 10; 
            reversed[i % maxlength] = byte(48 + remainder); 
            i++;
        } 
        bytes memory s = new bytes(i + 1); 
        for (uint j = 1; j <= i % maxlength; j++) { 
            s[j-1] = reversed[i - j];
        } 
        return bytes(s);
    }

    function bytesToInt(bytes memory b) internal pure returns (int result) {
        uint i = 0;
        uint tr = 0;
        result = 0;
        bool sign = false;
        if(b[i] == "-") {
            sign = true;
            i++;
        } else if(b[i] == "+") {
            i++;
        }
        while(uint8(b[b.length - tr - 1]) == 0x00) {
            tr++;
        }
        for (;i < b.length - tr; i++) { 
            uint8 c = uint8(b[i]); 
            if (c >= 48 && c <= 57) { 
                result *= 10;
                result = result + int(c - 48);
            }
        }
        if(sign) {
            result *= -1;
        } 
    }
    
    function intToBytes(int v) internal pure returns (bytes memory) {
        uint maxlength = 100; 
        bytes memory reversed = new bytes(maxlength);
        uint i = 0;
        uint x;
        if(v < 0)
            x = uint(-v);
        else
            x = uint(v);
        while (x != 0) { 
            uint8 remainder = uint8(x % 10); 
            x = x / 10; 
            reversed[i % maxlength] = byte(48 + remainder); 
            i++;
        }
        if(v < 0)
            reversed[(i++) % maxlength] = "-";
        bytes memory s = new bytes(i+1); 
        for (uint j = 1; j <= i % maxlength; j++) { 
            s[j - 1] = reversed[i - j];
        } 
        return bytes(s); 
    }
}

