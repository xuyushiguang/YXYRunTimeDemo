# YXYRunTimeDemo
runtime  运行时 动态添加方法 交换方法 swizzing hook<br>

 ***关于class_addMethod(...)这个函数的解释***
 ```
 cls:要添加函数的目标类，<br>
 sel：要添加的函数名，可以随意，但是参数必须和第三个参数所表示的函数保持一致<br>
 imp：实现函数的指针，也即是sel函数的实现函数，可以在任何地方实现，但是必须能找到这个指针imp<br>
 types参数解释:"v@:";v表示方法返回值是void，第一个@表示self，第二个：表示SEL，<br>
 其他符号在这个文件上面已列出，也可以去下面这个网址查看<br>
 苹果文档协定https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ObjCRuntimeGuide/Articles/ocrtTypeEncodings.html <br>
 BOOL class_addMethod(Class _Nullable cls, SEL _Nonnull name, IMP _Nonnull imp, const char * _Nullable types)
 ```
[苹果官网](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ObjCRuntimeGuide/Articles/ocrtTypeEncodings.html)
