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

// SPDX-License-Identifier: UNLICENSED
pragma solidity^0.6.10;

// 定义接口
interface IDivergence {
    // 注册
    function register(string memory _name) external;
    // 出手
    function punch(bytes32 _hash) external;
    // 证明
    function proofing(string memory _salt, uint8 _opt) external;
    // 查看获胜
    // 返回值： 1. 昵称 2. 玩家1出手 3. 玩家2出手 4. 轮次
    function winner() external view returns (string memory, string memory, string memory, uint256);
}
