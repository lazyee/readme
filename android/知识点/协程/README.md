### 1. Kotlin的协程是什么，它和线程有什么区别
Kotlin 协程（Coroutine）本质上是一种轻量级的并发编程模型，用于以同步的写法完成异步任务。
你可以把它理解为：协程 = 可以被挂起（suspend）并在之后恢复执行的“函数”
	•	suspend：挂起函数
	•	CoroutineScope：作用域（控制生命周期）
	•	Dispatcher：调度线程（比如 IO / Main）

##### 协程和线程有什么不同
协程不是线程，它的核心是：
编译器 + 状态机 + 回调的封装
编译器会把 suspend 函数转换成一个状态机（state machine），在挂起点保存执行状态，恢复时继续执行。

在Android中协程序会跟随生命周期的结束自动取消，而线程不会

总结:
Kotlin 协程本质是基于挂起和恢复机制实现的轻量级并发模型，它通过在用户态调度任务，实现了比线程更低的开销和更高的并发能力，同时用同步代码风格写异步逻辑，提高了代码可读性和可维护性。

##### 在Android中更新UI不是必须切换线程吗，那么为什么说协程比线程轻量级
在 Android 中更新 UI 确实必须切换到 Main 线程，这一步是平台限制，与是否使用协程无关。协程的优势在于，它在 IO 等耗时操作中通过挂起避免线程阻塞，并在需要时通过轻量级调度恢复执行，从而减少线程创建和阻塞带来的系统开销。

##### 协程本身有并发机制吗
Kotlin 协程本身不提供并行能力，它只是任务调度和挂起恢复机制；真正的并行执行依赖于底层线程池（如 Dispatchers.Default/IO）和多核 CPU。

##### 协程的任务调度和挂起恢复机制是通过什么体现的
```kotlin
/*
在 lifecycleScope.launch 中，协程在 Main 线程启动，当执行到 suspend 函数 getUser() 时，协程会被挂起，保存当前执行状态（Continuation），但不会阻塞线程。当前线程会继续执行其他任务。当异步结果返回后，通过 resume 恢复协程，并在合适的线程（通常是 Main）继续执行后续代码。
*/
lifecycleScope.launch {
    val data = getUser()   // 👈 挂起点,getUser()是用suspend修饰的函数
    textView.text = data   // 👈 恢复后执行
}
```
##### suspend函数是不是会自动切换线程
在协程中，线程切换不是自动发生的，而是由 Dispatcher 控制。如果 suspend 函数内部没有进行线程调度（例如普通 IO 操作），开发者必须通过 withContext(Dispatchers.IO) 手动切换线程，否则代码会在当前线程执行。只有像 Retrofit 这类已经封装了异步调度的库，才不需要额外切线程。

##### withContext 和 launch 的区别？
launch 用于启动一个并发协程（不返回结果），而 withContext 用于切换协程上下文并获取返回结果（顺序执行）。