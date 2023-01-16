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


pragma solidity^0.4.25;
import "./LibSafeMathForUint256Utils.sol";

library LibSafeMathForFloatUtils {
    using LibSafeMathForUint256Utils for uint256;
    
    /*
        fmul：浮点数乘法
        a：被乘数
        dA：被乘数a的精度，若a = 1234，dA=2，实际表示浮点型数为12.34 
        b：乘数
        dB：乘数的精度
        返回值：乘法后的结果，精度值(以被乘数精度为准)
        100.01 * 100.01 = 10000.0001 => 10000.00 
    */
    function fmul(uint256 a, uint8 dA, uint256 b, uint8 dB) internal pure returns (uint256 c, uint8 decimals) {
        decimals = dA;
        c = a.mul(b).div(10 ** uint256(dB));
    }
    
    /*
        fdiv：浮点数除法
        a：被除数
        dA：被除数a的精度，若a = 1234，decimalsA=2，实际表示浮点型数为12.34 
        b：除数
        dB：除数的精度
        返回值：除法后的结果，精度值(以被除数精度为准)
        10000.00 / 100.00 = 100.00
    */
    function fdiv(uint256 a, uint8 dA, uint256 b, uint8 dB) internal pure returns (uint256 c, uint8 decimals)  {
        decimals = dA;
        if(dA == dB) {
            c = a.mul(10 ** uint256(dA)).div(b);
        }
        else if(dA > dB) {
            //第一个参数精度更大
            b = b.mul(10 **uint256(dA - dB) );
            c = a.mul(10 ** uint256(dA)).div(b);
        } else {
            //第2个参数精度更大
            b = b.div(10 ** uint256(dB - dA) );
            c = a.mul(10 ** uint256(dA)).div(b);
        }
    }
    
    /*
        fadd：浮点数加法
        a：加数a
        dA：加数a的精度，若a = 1234，decimalsA=2，实际表示浮点型数为12.34 
        b：加数b
        dB：加数b的精度
        返回值：加法后的结果，精度值(以第1个参数精度为准)
    */
    function fadd(uint256 a, uint8 dA, uint256 b, uint8 dB) internal pure returns (uint256 c, uint8 decimals)  {
        decimals = dA;
        if(dA == dB) {
            c = a.add(b);
        }
        else if(dA > dB) {
            //第一个参数精度更大
            b = b.mul(10 **uint256(dA - dB) );
            c = a.add(b);
        } else {
            //第2个参数精度更大
            b = b.div(10 ** uint256(dB - dA) );
            c = a.add(b);
        }
    }
    
    /*
        fsub：浮点数减法
        a：被减数
        dA：被减数a的精度，若a = 1234，decimalsA=2，实际表示浮点型数为12.34 
        b：减数
        dB：减数b的精度
        返回值：减法后的结果，精度值(以第1个参数精度为准)
    */
    function fsub(uint256 a, uint8 dA, uint256 b, uint8 dB) internal pure returns (uint256 c, uint8 decimals)  {
        decimals = dA;
        if(dA == dB) {
            c = a.sub(b);
        } else if (dA > dB) {
            c = a.sub(b.mul(10 ** uint256(dA - dB)));
        } else {
            c = a.sub(b.div(10 ** uint256(dB - dA)));
        }
        
    }
    
    
}

    
    