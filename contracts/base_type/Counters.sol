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
 * @title Counters
 * @dev 提供只能递增或递减1的计数器。这可以用于例如 跟踪铸造的ERC721的id或计数请求id。
 * 
 * 用法: `using Counters for Counters.Counter;`
 */
library Counters {
    struct Counter {
        uint256 _value; // default: 0
    }

    function current(Counter storage counter) internal view returns (uint256) {
        return counter._value;
    }

    function increment(Counter storage counter) internal {
        // 以1为增量，要达到2^256=1.1579209e+77,几乎不存在这样的场景,所以跳过了加法的安全检查,以节省gas
        counter._value += 1;
    }

    function decrement(Counter storage counter) internal {
        require(counter._value >= 1, "Counters decrement: subtraction overflow");
        counter._value = counter._value - 1;
    }
}
