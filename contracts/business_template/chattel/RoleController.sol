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

/**
* 角色控制器
*/
pragma solidity ^0.4.25;
pragma experimental ABIEncoderV2;

import "./utils/Ownable.sol";
import "./utils/LibString.sol";
import "./role/RoleStorage.sol";

contract RoleController is Ownable {

    using LibString for string;

    string constant DK_Role = "DK";	// 货款方
    string constant ZJ_Role = "ZJ";	// 资金方
    string constant JG_Role = "JG";	// 监管方

    RoleStorage private roleStorage;

    event SetDKRoleResult(bool);
    event ResetDKRoleResult(bool);
    event SetZJRoleResult(bool);
    event ResetZJRoleResult(bool);
    event SetJGRoleResult(bool);
    event ResetJGRoleResult(bool);

    constructor() public {
        roleStorage = new RoleStorage();
    }

    /** 授权货款方角色
    * _user_id 用户id
    */
    function setDKRole(string _user_id) external onlyOwner returns(bool){
        int256 count = roleStorage.addRole(DK_Role, _user_id);
        emit SetDKRoleResult(count > int256(0));
        return count > int256(0);
    }

    /** 重置货款方角色
    * _user_id 用户id
    */
    function resetDKRole(string _user_id) external onlyOwner returns(bool){
        int256 count = roleStorage.removeRole(DK_Role, _user_id);
        emit ResetDKRoleResult(count > int256(0));
        return count > int256(0);
    }

    /** 授权资金方角色
    * _user_id 用户id
    */
    function setZJRole(string _user_id) external onlyOwner returns(bool){
        int256 count = roleStorage.addRole(ZJ_Role, _user_id);
        emit SetZJRoleResult(count > int256(0));
        return count > int256(0);
    }

    /** 重置资金方角色
    * _user_id 用户id
    */
    function resetZJRole(string _user_id) external onlyOwner returns(bool){
        int256 count = roleStorage.removeRole(ZJ_Role, _user_id);
        emit ResetZJRoleResult(count > int256(0));
        return count > int256(0);
    }

    /** 授权监管方角色
    * _user_id 用户id
    */
    function setJGRole(string _user_id) external onlyOwner returns(bool){
        int256 count = roleStorage.addRole(JG_Role, _user_id);
        emit SetJGRoleResult(count > int256(0));
        return count > int256(0);
    }

    /** 重置资金方角色
    * _user_id 用户id
    */
    function resetJGRole(string _user_id) external onlyOwner returns(bool){
        int256 count = roleStorage.removeRole(JG_Role, _user_id);
        emit ResetJGRoleResult(count > int256(0));
        return count > int256(0);
    }

}