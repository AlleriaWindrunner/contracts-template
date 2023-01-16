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

import "./RoleStorage.sol";

contract Role {

    string constant private DK_Role = "DK";	// 货款方
    string constant private ZJ_Role = "ZJ";	// 资金方
    string constant private JG_Role = "JG";	// 监管方

    RoleStorage private roleStorage;

    constructor() public {
        roleStorage = new RoleStorage();
    }

    function onlyDKRole(string memory _user_id) public view{
        require(roleStorage.hasRole(DK_Role, _user_id), "not has dk permission");
    }

    function onlyZJRole(string memory _user_id) public view{
        require(roleStorage.hasRole(ZJ_Role, _user_id), "not has zj permission");
    }

    function onlyJGRole(string memory _user_id) public view{
        require(roleStorage.hasRole(JG_Role, _user_id), "not has jg permission");
    }

}
