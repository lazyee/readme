### FLOW
Flow 数据流
StateFlow 状态流
SharedFlow 事件流

#### 简述
Kotlin Flow 体系中并不存在复杂的继承结构，核心只有 Flow 接口，其常用实现主要分为三类：Cold Flow 用于一次性数据流，StateFlow 用于持有并更新 UI 状态，SharedFlow 用于事件广播。三者分别对应数据、状态和事件三种不同的业务语义。