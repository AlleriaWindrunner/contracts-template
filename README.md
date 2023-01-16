# contracts-templates
contract-templates智能合约库包含了基础类型、数据结构、通用功能、上层业务等智能合约库。用户可根据实际需求进行参考、复用。

## 智能合约详细说明

### 基础类型层

| 库                          | 功能           | 说明                                                            | API                                                 |
|----------------------------|--------------|---------------------------------------------------------------|-----------------------------------------------------|
| LibSafeMathForUint256Utils | 数学运算         | 加减乘除、幂、最大值最小值、平均值等                                            | [API](docs/base_type/LibSafeMathForUint256Utils.md) |
| LibSafeMathForFloatUtils   | 浮点数运算        | 提供了浮点型的相关计算操作，且保证数据的正确性和安全性，包括加法、减法、乘法、除法等操作                  | [API](docs/base_type/LibSafeMathForFloatUtils.md)   |
| LibConverter               | 整型转换操作	      | 和各数据类型之间的转换等                                                  | [API](docs/base_type/LibConverter.md)               |
| LibString                  | 字符串操作        | 取长度、判断起始终止、查找子父、求子串、拼接、比较、大小写转换等                              | [API](docs/base_type/LibString.md)                  |
| LibAddress                 | 地址操作         | 和各数据类型之间的转换；合约地址判断等                                           | [API](docs/base_type/LibAddress.md)                 |
| LibArrayForUint256Utils    | 排序、查找、去重、拼接等 | 排序、查找、去重、拼接等 | [API](docs/base_type/LibArrayForUint256Utils.md)    |
| Lib2DArrayForUint256       | 数组操作         | 提供了Uint256二维数组的相关操作，包括增加新元素，删除元素，修改值，查找值，合并扩展数组等操作            | [API](docs/base_type/Lib2DArrayForUint256.md)       |
| LibBits                    | 位操作          | 提供了位操作方法，例如按位非、移位、取前/后n位等方法                                   | [API](docs/base_type/Lib2DArrayForUint256.md)       |

### 数据结构层

| 库                          | 功能           | 说明                                                            | API                                                 |
|----------------------------|--------------|---------------------------------------------------------------|-----------------------------------------------------|
| LibMaxHeapUint256 | 堆            | 最大堆相关操作，取最值、插入、删除等   | [API](docs/data_structure/LibMaxHeapUint256.md) | 
| LibMinHeapUint256   | 堆            | 最小堆相关操作，取最值、插入、删除等  | [API](docs/data_structure/LibMinHeapUint256.md)   |
| LibStack               | 栈	           | 提供栈相关操作，如进栈、出栈等     | [API](docs/data_structure/LibStack.md)               |
| LibQueue                  | 队列           | 单向队列相关操作，入队、出队等     | [API](docs/data_structure/LibQueue.md)                  |
| LibDeque                 | 队列           | 双向队列相关操作，入队、出队等     | [API](docs/data_structure/LibDeque.md)                 |
| LibAddressSet    | address类型集合  | 集合操作，增删改查等 | [API](docs/data_structure/LibAddressSet.md)    |
| LibBytes32Set       | bytes32类型集合  | 提供了存储Bytes32类型的Set数据结构，支持包括add, remove, contains, getAll等 | [API](docs/data_structure/LibBytes32Set.md)       |
| LibBytesMap                    | 映射           | 映射操作，存、取、移除等  | [API](docs/data_structure/LibBytesMap.md)       |
| LibLinkedList                    | 双向链表         | 链表相关操作  | [API](docs/data_structure/LibLinkedList.md)       |
| LibSingleList  | 单向链表	        | 包括链表更新、查询、迭代等  | [API](docs/data_structure/LibSingleList.md)       |
| DataTable  | 模拟数据库表的实现    | 提供了模拟row、table等实现  | [API](docs/data_structure/DataTable.md)       |
| Map            | 模拟映射的实现      | 提供了基于bytes32主键、自定义类型值的可迭代、可查询的映射  | [API](docs/data_structure/Map.md)       |
| LibMerkleTree  | 默克尔树实现       | 提供了默克尔树的生成和验证方法 | [API](docs/data_structure/LibMerkleTree.md)       |

### 通用功能层

| 库                          | 功能          | 说明                                                            | API                                           |
|----------------------------|-------------|---------------------------------------------------------------|-----------------------------------------------|
| Table | CRUD合约	     | 提供CRUD体验   |                         |
| Crypto   | 密码学	        | 国密哈希、验签、VRF等  | [API](docs/default/crypto/Crypto.md)          |
| LibCryptoHash               | 内置密码相关的函数		 | keccak256、sha3、ripemd160等     | [API](docs/default/crypto/LibCryptoHash.md)   |
| LibDecode                  | 验签          | 验证签名等功能等     | [API](docs/default/crypto/LibDecode.md)       |
| proxy                 | 代理模式        | 代理执行即代理模式的实现     | [API](docs/default/proxy/proxy.md)            |
| internalFunction    | 内置相关的函数| 包括block,tx相关等 | [API](docs/default/internalFunction.md)       |


### 常用工具层

| 库                          | 功能          | 说明                                                            | API                                      |
|----------------------------|-------------|---------------------------------------------------------------|------------------------------------------|
| DateTimeContract | 时间戳解析		     | 基于时间戳计算当前的日期	   | [API](docs/common_tools/crypto/DateTimeContract.md)                                         |
| DGHV	   | 同态加密	        | 一种基于智能合约的全同态加密方法	  | [API](docs/common_tools/crypto/DGHV.md)  |
| FiatShamirZK	               | 同态加密			 | 一种零知识证明协议方法     | [API](docs/common_tools/FiatShamirZK.md) |
| RBAC                  | 基于角色的权限管理	          | RBAC     | [API](docs/common_tools/RBAC.md)    |
| RoleOperation                 | 角色操作	        | RoleOperation     | [API](docs/common_tools/RoleOperation.md)        |
| whiteList	    | 白名单操作	| 白名单管理的实现	 | [API](docs/common_tools/whiteList.md)  |
| MathAdvance	    | 数学运算	| 开方，平方，对数，幂 | [API](docs/common_tools/MathAdvance.md)  |
| LibAscii	    | asc码转换	| asc码转换 | [API](docs/common_tools/LibAscii.md)  |
