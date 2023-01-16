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

/**
* @author eleven <eleven.hm@vip.163.com>
* @title  uint256类型 二维数组操作
* 提供二维数组的操作，增加新元素，删除元素，修改值，查找值，合并扩展数组等
**/

library Lib2DArrayForUint256 {
    /**
    *@dev 二维数组中增加一个数组元素
    *@param  array uint256类型二维数组
    *@param  value uint256类型一维数组
    **/
    function addValue(uint256[][] storage array,uint256[] value) internal{
        require(value.length > 0, "Empty Array: can not add empty array");
        array.push(value);
    }

    /**
    *@dev    查找二维数组中指定位置的值
    *@param  array uint256类型二维数组
    *@param  row   值所在的行
    *@param  col   值所在的列
    *@return uint256 返回查找的值
    **/
    function getValue(uint256[][] storage array, uint256 row, uint256 col) internal returns (uint256) {
        if(array.length == 0){
            return 0;
        }
        require(row < array.length,"Row: index out of bounds");
        require(col < array[row].length, "Col: index out of bounds");
        return array[row][col];
    }

    /**
    *@dev    修改二维数组中指定位置的值
    *@param  array uint256类型二维数组
    *@param  row   值所在的行
    *@param  col   值所在的列
    *@param  val   修改指定位置的值为val
    *@return uint256[][] 返回修改后的数组
    **/
    function setValue(uint256[][] storage array, uint256 row, uint256 col, uint256 val) internal returns (uint256[][]) {
        if(array.length == 0){
            return;
        }

        require(row < array.length,"Row: index out of bounds");
        require(col < array[row].length, "Col: index out of bounds");
        array[row][col] = val;
        return array;
    }

    /**
    *@dev    修改二维数组中指定位置的值
    *@param  array uint256类型二维数组
    *@param  row   值所在的行
    *@param  col   值所在的列
    *@param  val   修改指定位置的值为val
    *@return uint256[][] 返回修改后的数组
    **/
    function firstIndexOf(uint256[][] storage array, uint256 val) internal returns (bool, uint256, uint256) {
        uint256  row;
        uint256  col;
        if (array.length == 0) {
            return (false, 0, 0);
        }
        for(uint256 i = 0; i < array.length; i++) {
            for(uint256 j = 0; j < array[i].length; j++) {
                if(array[i][j] == val){
                    row = i;
                    col = j;
                    return (true, row, col);
                }
            }
        }
        return (false, 0, 0);
    }

    /**
    *@dev    删除二维数组中的某个数组元素
    *@param  array uint256类型二维数组
    *@param  index 删除第index个数组元素
    *@return uint256[][] 返回修改后的数组
    **/
    function removeByIndex(uint256[][] storage array, uint256 index) internal returns(uint256[][]) {
        require(index < array.length, "Index: index out of bounds");
        delete array[index];

        while(index < array.length -1) {
            delete array[index];
            for(uint256 i = 0; i < array[index + 1].length; i++){
                array[index].push(array[index + 1][i]);
            }
            index++;
        }
        array.length--;
        return array;
    }

    /**
    *@dev    合并两个二维数组
    *@param  array1 uint256类型二维数组
    *@param  array2 uint256类型二维数组
    *@return uint256[][] 返回合并后的数组
    **/
    function extend(uint256[][] storage array1, uint256[][] storage array2) internal returns(uint256[][]){
        require(array2.length > 0, "Extend: can not extend empty array");

        for(uint256 i = 0; i < array2.length; i++){
            array1.push(array2[i]);
        }
        return array1;
    }
}