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
import "./LibArrayForUint256Utils.sol";
contract ArrayDemo {

    uint[] private array;
    uint[] private array1;
    uint[] private array2;

    function f1() public view {
        array=new uint[](0);
        // array add element 2
        LibArrayForUint256Utils.addValue(array,2);
        // array: {2}
    }


    function f2() public view {
        array1=new uint[](2);
        array2=new uint[](2);
        LibArrayForUint256Utils.extend(array1,array2);
        // array1 length 4
    }

    function f3() public view {
        array=new uint[](2);
        array[0]=2;
        array[1]=2;
        LibArrayForUint256Utils.distinct(array);
        // array: {2}
    }
}
