

## Features

Plugins for Wrapper, you can process your existing projects step by step, complete redundant code addition, file name modification, class name prefix modification, assets resource classification.
Or you can modify the corresponding source code to achieve your purpose.
为马甲包而生的插件，你可以根据一步一步处理你现有的工程，完成冗余代码添加，文件名称修改，类名前缀修改，assets资源分类。
或者可以修改相应的源码，已到达你要的目的。

## Usage

```dart
  // 终端执行
// flutter pub run spam_code_package:main
// 只修改工程lib目录下的dart文件
String libPath = 'lib';
var current = DateTime.now();
// print('main start...$current, ${current.millisecondsSinceEpoch} ms');

// await Calculator().generateSpamCode('$libPath/ui/page/game_room/room_page');
// 第一步：添加类似方法的冗余方法
// await Calculator().generateSpamCode(libPath);
// 第二步：修改文件名称
// await Calculator().modifyFileNamePrefix(libPath);
// 第三步：修改引用文件代码
// 该处理并不完善，需要手动根据报错修改引用，重新生成json解析类
// await Calculator().modifyFileNameRefPrefix(libPath);
// 第四步：修改类名前缀
// await Calculator().modifyClassNamePrefix3(libPath);
// 资源分类
// await Calculator().modifyAssetsNamePrefix(libPath);
// await Calculator().getResourceCopy(libPath + '/ui/page/status');
var end = DateTime.now();
// print('main end...$end, ${end.millisecondsSinceEpoch - current.millisecondsSinceEpoch}ms');
```

## Additional information

Have fun
