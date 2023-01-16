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

pragma solidity ^0.4.24;

contract TableFactory {
    function openTable(string) public constant returns (Table);  // 打开表
    function createTable(string,string,string) public returns(int);  // 创建表
}

// 查询条件
contract Condition {
    //等于
    function EQ(string, int) public;
    function EQ(string, string) public;

    //不等于
    function NE(string, int) public;
    function NE(string, string)  public;

    //大于
    function GT(string, int) public;
    //大于或等于
    function GE(string, int) public;

    //小于
    function LT(string, int) public;
    //小于或等于
    function LE(string, int) public;

    //限制返回记录条数
    function limit(int) public;
    function limit(int, int) public;
}

// 单条数据记录
contract Entry {
    function getInt(string) public constant returns(int);
    function getAddress(string) public constant returns(address);
    function getBytes64(string) public constant returns(byte[64]);
    function getBytes32(string) public constant returns(bytes32);
    function getString(string) public constant returns(string);

    function set(string, int) public;
    function set(string, string) public;
    function set(string, address) public;
}

// 数据记录集
contract Entries {
    function get(int) public constant returns(Entry);
    function size() public constant returns(int);
}

// Table主类
contract Table {
    // 查询接口
    function select(string, Condition) public constant returns(Entries);
    // 插入接口
    function insert(string, Entry) public returns(int);
    // 更新接口
    function update(string, Entry, Condition) public returns(int);
    // 删除接口
    function remove(string, Condition) public returns(int);

    function newEntry() public constant returns(Entry);
    function newCondition() public constant returns(Condition);
}