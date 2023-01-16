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

pragma solidity ^0.4.25;

//通过log函数重载，对不同类型的变量trigger不同的event，实现solidity打印效果，使用方法为：log(string name, var value)
contract Console {

    event LogString(string, string);
    function log(string s , string x) internal {
        emit LogString(s, x);
    }

    event LogUint(string, uint);
    function log(string s , uint x) internal {
        emit LogUint(s, x);
    }
    
    event LogInt(string, int);
    function log(string s , int x) internal {
        emit LogInt(s, x);
    }
    
    event LogBytes(string, bytes);
    function log(string s , bytes x) internal {
        emit LogBytes(s, x);
    }
    
    event LogBytes32(string, bytes32);
    function log(string s , bytes32 x) internal {
        emit LogBytes32(s, x);
    }

    event LogAddress(string, address);
    function log(string s , address x) internal {
        emit LogAddress(s, x);
    }

    event LogBool(string, bool);
    function log(string s , bool x) internal {
        emit LogBool(s, x);
    }
}