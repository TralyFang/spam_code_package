library spam_code_package;

import 'dart:io';

import 'dart:math';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:ybd_oyetalk/common/analytics/thinking/ta_common_track.dart';
// import '../../../module/status/entity/status_entity.dart';
// import 'package:ybd_oyetalk/generated/json/base/json_ybd_convert_content.dart';
// import '../../../../generated/json/base/json_ybd_convert_content.dart';
// import '../../../common/constant/const.dart';
// import 'dart:bottom_selector_sheet.dart';
// import 'bottom_selector_sheet.dart';
// import 'package:get/get.dart';
// import 'dart:developer';
// import '../received_socket_message.dart';
// import 'widget/configurable_activity.dart';
// import 'package:ybd_oyetalk/module/inbox/inbox_api_ybd_helper.dart';
// export './src/box_shadow.dart';
// export './src/box_decoration.dart' show BoxDecoration;
// import 'package:oye_tool_package/ext/string_ext.dart';
// import './box_ybd_shadow.dart';
// import './src/box_shadow.dart';


/*
  Widget myBuild(BuildContext context) {
  Widget _itemBg() {
  Future<void> setBasePathF04yxoyelive(Widget w) async {
  void mapEventToStateJPKjMoyelive(GameMicEvent event) async* {
* */

/// A Calculator.
class Calculator {
  /// Returns [value] plus 1.
  int addOne(int value) => value + 1;

  // 方法的标识符
  static const String funcIdentifier = 'oyelive';
  // 需要检测的包引用
  static const String packageName = 'package:oyelive_main';
  // 文件名前缀（有下划线'_' 才在第一个下划线追加） 如：inbox_api_helper.dart --> inbox_ybd_api_helper.dart
  static const String filePrefix = 'ybd';
  // 类名前缀
  static const String classPrefix = 'YBD';

  void ffff() {
    int needCount = 0;
    print('input result:$needCount');
  }

  // 添加垃圾代码的方法内容
  String funcInputString = '''\n
     int needCount = 0;
     print('input result:\$needCount');
  }
  ''';

  // 获取目录下资源，并copy一份到新路径
  Future<void> getResourceCopy(String filePath, {String prefix = filePrefix}) async {
    var reg = RegExp(r'(?!(//[\s\S]*))assets/\S*(.webp|.png|.jpeg|.gif|.svga|.mp3)');
    String newDir = 'assets/${filePath.split('/').last}_temp';
    if (!Directory(newDir).existsSync()) {
      await Directory(newDir).create(recursive: true);
      print('create Directory:$newDir');
    }
    String assetsDir = 'assets';
    var assetsFiles = dirFils(assetsDir);
    var files = dirFils(filePath);
    for (var file in files) {
      String contents = await readFileAsString(file.path);
      if (contents.isEmpty) continue;
      print('starting...${files.indexOf(file)}/${files.length},$file');
      reg.allMatches(contents).forEach((match) {
        var matchRes = match.group(0)!;

        if (!File(matchRes).existsSync()) {
          // 文件不存在，需要匹配到对应的文件路径
          var preReg = matchRes.split('\$').first;
          print('preReg:$preReg');
          assetsFiles.where((element) => element.path.contains(preReg)).forEach((e) {
            var newPath = newDir + "/${e.path.split('/').last}";
            print('match.assets:${e.path}, new:${e.path}');
            File(e.path).copy(newPath);
          });
          return;
        }
        var newPath = newDir + "/${matchRes.split('/').last}";
        print('match:$matchRes, new:$newPath');
        File(matchRes).copy(newPath);
      });
    }

    var size = await getTotalSizeOfFilesInDir(Directory(newDir));
    print('newDir:$newDir, size:${(size/1024.0).toStringAsFixed(2)}KB');

  }

  // 资源名字加引用修改
  Future<void> modifyAssetsNamePrefix(String filePath, {String prefix = filePrefix}) async {
    // assets/images/agent_share.webp
    // assets/images/baggage.png
    // assets/images/top_up_beans@2x.webp

    // String topUpDis = 'topup';
    // String topUpPre = '/$topUpDis/y_';
    // String assetsDir = 'assets/images';
    // String newDir = assetsDir+'/$topUpDis';
    // var topUpReg = RegExp(r'assets/images/top\S+(.webp|.png|.jpeg)');

    // String topUpDis = 'eid';
    // String topUpPre = '/$topUpDis/';
    // String assetsDir = 'assets/images';
    // String newDir = assetsDir+'/$topUpDis';
    // var topUpReg = RegExp(r'assets/images/eid\S+(.webp|.png|.jpeg)');

    String topUpDis = 'inbox';
    String topUpPre = '/$topUpDis/';
    String assetsDir = 'assets/images';
    String newDir = assetsDir+'/$topUpDis';
    var topUpReg = RegExp(r'assets/images/('
    '$topUpDis'
    r')\S*(.webp|.png|.jpeg|.gif)');
    String yamlReplace = '    - assets/images/$topUpDis/\n'; // 注意前面有四个空格，格式需要严格匹配的！

    // 创建新文件夹
    if (!Directory(newDir).existsSync()) {
      await Directory(newDir).create(recursive: true);
      print('create Directory:$newDir');
    }
    var assetsFiles = dirFils(assetsDir);
    for (var path in assetsFiles) {
      if (topUpReg.hasMatch(path.path)) {
        if (path.path.contains(topUpPre)) continue;
        var last = path.path.split('/').last;
        var newPath = assetsDir + topUpPre + last;
        print('newPath:$newPath');
        // 移到新文件夹
        path.rename(newPath);
      }
    }

    // 追加assets
    var yamlPath = 'pubspec.yaml';
    var yamlReg = RegExp(r' {2}assets:\n(( {4}|( +)?#( +)?)- assets/\S+\n)+');
    String yamlContents = await readFileAsString(yamlPath);
    int insetIndex = yamlReg.firstMatch(yamlContents)!.end;
    if (!yamlContents.contains(yamlReplace)) {
      yamlContents = yamlContents.replaceRange(insetIndex, insetIndex, yamlReplace);
      File(yamlPath).writeAsString(yamlContents);
      print('yaml add: $yamlReplace');
    }


    // 修改引用代码
    var files = dirFils(filePath);
    for (var file in files) {
      String contents = await readFileAsString(file.path);
      if (contents.isEmpty) continue;
      print('starting...${files.indexOf(file)}/${files.length},$file');
      var newContents = contents.toString();
      var addIndex = 0;
      topUpReg.allMatches(contents).forEach((match) {
        var matchRes = match.group(0)!;
        if (matchRes.contains(topUpPre)) return;
        var last = matchRes.split('/').last;
        var lastIndex = matchRes.lastIndexOf('/');
        var replace = '${matchRes.substring(0, lastIndex)}$topUpPre$last';
        print('matchRes: $matchRes, $replace');
        newContents = newContents.replaceRange(
            match.start+addIndex,
            match.end+addIndex,
            replace);
        addIndex+=topUpPre.length-1;
      });
      if (contents != newContents) {
        File(file.path).writeAsString(newContents);
      }
    }

  }



  // 第一步： 单纯修改文件名
  Future<void> modifyFileNamePrefix(String filePath, {String prefix = filePrefix}) async {
    var files = dirFils(filePath);
    for (var file in files) {
      if (file.path.contains('/generated/') ||
          file.path.contains('firebase_options.dart') ||
          !file.path.endsWith('.dart')) continue;
      var fileName = file.path.split('/').last;
      var fileFirst = fileName.split('_').first;
      var newFileName = fileFirst + '_$prefix' + fileName.substring(fileFirst.length);
      var newFile = file.path.substring(0, file.path.length-fileName.length)+newFileName;
      print('starting...$newFileName, $newFile');
      // 没有下划线的文件，就不用重命名了, 且没有包含prefix
      if (fileName.contains('_') &&
          !fileName.contains(prefix) &&
          !file.path.contains('main.dart')) {
        file.rename(newFile);
      }
    }
  }

  /*
  * 需要单独处理generated/json 路径的引用问题
  * 以及重新生成json 模型解析类
  * 如果一次处理的类过多，请分文件多次执行，避免修改异常
  * **/
  // 第二步：修改引用的路径
  Future<void> modifyFileNameRefPrefix(String filePath, {String prefix = filePrefix}) async {

    var regImport = RegExp(r'(^import \S((\.\./)+|'
    '$packageName'
    r'/)(?!(generated/))(\S+)?\b\w+_\w+\b\.dart)|'
    r'(^(import|export) \S(?<!(dart:))(\./)?((\w+/)+)?\b\w+_\w+\b\.dart)', multiLine: true);
    var regName = RegExp(r'\b\w+_\w+\b\.dart');
    var files = dirFils(filePath);
    for (var file in files) {
      if (file.path.contains('/generated/') ||
          file.path.contains('firebase_options.dart') ||
          !file.path.endsWith('.dart')) continue;
      String contents = await readFileAsString(file.path);
      if (contents.isEmpty) continue;
      print('starting...ref:${file.path}');
      var newContent = contents.toString();
      regImport.allMatches(newContent).forEach((matchImp) async {
        String matchImport = matchImp.group(0)!;
        // for (int i= 0; i<matchImp.groupCount; i++) {
        //   print('matchImport:${matchImp.group(i)}');
        // }
        // print('matchImp:${matchImp.groupNames},${matchImp.groupCount}, $matchImport');
        if (!matchImport.contains('/generated/')) {
          await Future.forEach<RegExpMatch>(regName.allMatches(matchImport), (matchNam) async {

          // });
          // regName.allMatches(matchImport).forEach((matchNam) {
            String matchName = matchNam.group(0)!;
            // 只有下划线才执行替换, 且没有包含prefix
            if (matchName.contains('_') &&
                !matchName.contains(prefix) &&
                matchName != 'firebase_options.dart') {
              var nameFirst = matchName.split('_').first;
              var newName = nameFirst + '_$prefix' + matchName.substring(nameFirst.length);
              print('newName:$newName, mathchName:$matchName');
              var regStr = r'\b'
                  '$matchName'
                  r'\b';
              newContent = newContent.replaceAll(RegExp(regStr), newName);
            }
          });
        }
      });
      if (contents != newContent) {
        File(file.path).writeAsString(newContent);
      }
    }
  }


  // 给类名添加前缀(耗时)
  Future<void>  modifyClassNamePrefix(String filePath, {String prefix = classPrefix}) async {
    var files = dirFils(filePath);
    for (var file in files) {
      if (file.path.contains('/generated/')) continue;
      if (!file.path.endsWith('.dart')) continue;
      String contents = await readFileAsString(file.path);
      if (contents.isEmpty) continue;
      final RegExp classReg = RegExp(r'^class \b\w+\b', multiLine: true);
      print('starting...${files.indexOf(file)}/${files.length},$file');
      classReg.allMatches(contents).forEach((match) async {
        String matchClass = match.group(0)!;
        String className = matchClass.substring(6);
        print('className:$className');
        var regStr = r'\b'
            '$className'
            r'\b(?!(.dart))';
        var iReg = RegExp(regStr, caseSensitive: true);
        if (className.startsWith('_')) {
          // 私有类，只在当前文件查找替换
          if (!className.startsWith('_$prefix') && iReg.hasMatch(contents)) {
            print('_file:$className--->_$prefix${className.substring(1)}, $file');
            contents = contents.replaceAll(iReg, '_$prefix${className.substring(1)}');
            File(file.path).writeAsString(contents);
          }
        }else {
          // if (className.startsWith(prefix)) return;
          // 不是私有类，需要全局查找
          for (var ifile in files) {
            String icontents;
            if (ifile.path == file.path) {
              icontents = contents;
            }else {
              if (ifile.path.contains('/generated/')) continue;
              if (!ifile.path.endsWith('.dart')) continue;
              icontents = await readFileAsString(ifile.path);
            }
            if (icontents.isEmpty) continue;
            if (!className.startsWith(prefix) && iReg.hasMatch(icontents) && className != 'BoxDecoration') {
              print('ifile:$className--->$prefix$className, $ifile');
              icontents = icontents.replaceAll(iReg, '$prefix$className');
              File(ifile.path).writeAsString(icontents);
            }

          }
        }
      });
    }
  }

  // 给类名添加前缀
  Future<void>  modifyClassNamePrefix2(String filePath, {String prefix = classPrefix}) async {
    var files = dirFils(filePath);
    List<String> allClassNames = await findAllClassNames(filePath);
    int income = 100;
    int maxLength = min(355, allClassNames.length);
    for (int i=0; i<(maxLength+income)~/income; i++) {
      print('classRange0: ${(maxLength+income)~/income}, i:$i');
      // 0~99 100~101 4
      int minIncome = min(income, maxLength - i*income);
      var classRange = allClassNames.getRange(i*income, i*income+minIncome);

      print('classRange: ${i*income+minIncome}/$maxLength, in:$income');

      await Future.forEach<String>(classRange, (className) async {
      var regStr = r'\b'
          '$className'
          r'\b(?!(.dart))';
      var iReg = RegExp(regStr, caseSensitive: true);
      print('starting...${allClassNames.indexOf(className)}/${allClassNames.length}');
      for (var ifile in files) {
        if (ifile.path.contains('/generated/')) continue;
        if (!ifile.path.endsWith('.dart')) continue;
        var icontents = await readFileAsString(ifile.path);
        if (icontents.isEmpty) continue;
        if (className.startsWith('_')) {
          // 私有类，只在当前文件查找替换
          if (!className.startsWith('_$prefix') && iReg.hasMatch(icontents)) {
            print('_file:$className--->_$prefix${className.substring(
                1)}, $ifile');
            var newContents = icontents.replaceAll(
                iReg, '_$prefix${className.substring(1)}');
            if (newContents != icontents) {
              File(ifile.path).writeAsString(newContents);
            }
            // 私有类只在当前类修改就结束了
            return;
          }
        } else if (!className.startsWith(prefix) && iReg.hasMatch(icontents) &&
            className != 'BoxDecoration') {
          print('ifile:$className--->$prefix$className, $ifile');
          var newContents = icontents.replaceAll(iReg, '$prefix$className');
          if (newContents != icontents) {
            File(ifile.path).writeAsString(newContents);
          }
        }
      }
    });
    }
  }

  // 给类名添加前缀
  Future<void>  modifyClassNamePrefix3(String filePath, {String prefix = classPrefix}) async {
    var files = dirFils(filePath);
    List<String> allClassNames = await findAllClassNames(filePath);
    var startIndex = 0;
    var income = 3000;
    /*
    fiel*class
    1261*2171=> 2737631
    true:
    500: 3580ms
    1000: 6846ms 200
    1500: 275.length 3901ms

    false:
    200 2809ms
    */
    var endIndex = min(startIndex+income, allClassNames.length);
    allClassNames = allClassNames.getRange(startIndex, endIndex).toList();

    var enableNew = true;
    var newClassNames = [];
    if (enableNew) {
      var newClass = '';
      for (var i = 0; i < allClassNames.length; i++) {
        if (i % 12 == 0) {
          newClass = allClassNames[i];
          newClassNames.add(newClass);
        } else {
          var last = newClassNames.last;
          last = last + '|${allClassNames[i]}';
          newClassNames.last = last;
        }
      }
      print('newClassNames:${newClassNames.length}, ${newClassNames
          .first}, ${newClassNames.last}');
    }else {
      newClassNames = allClassNames;
    }

    for (var ifile in files) {
      if (ifile.path.contains('/generated/')) continue;
      if (!ifile.path.endsWith('.dart')) continue;
      var icontents = await readFileAsString(ifile.path);
      if (icontents.isEmpty) continue;
      print('starting...${files.indexOf(ifile)}/${files.length},$ifile');

      var newContents = icontents.toString();
      for (var className in newClassNames) {

        var regStr = r'\b'
            '($className)'
            r'\b(?!(.dart))';
        var iReg = RegExp(regStr, caseSensitive: true);

        if (enableNew) {
          if (iReg.hasMatch(icontents)) {
            int appendIndex = 0;
            iReg.allMatches(newContents).forEach((match) {
              String matchClass = match.group(0)!;
              print('matchClass:$matchClass, start:${match.start},${match.end}');
              if (matchClass.startsWith('_')) {
                // 私有类，只在当前文件查找替换
                if (!matchClass.startsWith('_$prefix')) {
                  print('_file:$matchClass--->_$prefix${matchClass.substring(
                      1)}, $ifile');
                  newContents = newContents.replaceRange(match.start+appendIndex, match.end+appendIndex, '_$prefix${matchClass.substring(1)}');
                  appendIndex+=prefix.length;
                }
              } else if (!matchClass.startsWith(prefix) && matchClass != 'BoxDecoration') {
                print('ifile:$matchClass--->$prefix$matchClass, $ifile');
                newContents = newContents.replaceRange(match.start+appendIndex, match.end+appendIndex, '$prefix$matchClass');
                appendIndex+=prefix.length;
              }
            });
          }
          continue;
        }

        if (className.startsWith('_')) {
          // 私有类，只在当前文件查找替换
          if (!className.startsWith('_$prefix') && iReg.hasMatch(icontents)) {
            print('_file:$className--->_$prefix${className.substring(
                1)}, $ifile');
            newContents = newContents.replaceAll(
                iReg, '_$prefix${className.substring(1)}');
          }
        } else if (!className.startsWith(prefix) && iReg.hasMatch(icontents) &&
            className != 'BoxDecoration') {
          print('ifile:$className--->$prefix$className, $ifile');
          newContents = newContents.replaceAll(iReg, '$prefix$className');
        }
      }
      if (newContents != icontents) {
        File(ifile.path).writeAsString(newContents);
      }
    }

  }

  // 查找所有的类
  Future<List<String>> findAllClassNames(String filePath) async {
    List<String> allClassNames = [];
    var allClassPath = File('./lib/all_class_names.txt');
    if (!allClassPath.existsSync()) {
      allClassPath.createSync();
    }else {
      allClassNames = allClassPath.readAsStringSync().split('\n');
      print('end findAllClassNames exists count:${allClassNames.length}');
      allClassNames = allClassNames.where((value) => !value.startsWith('#')).toList();
      print('end findAllClassNames exists where count:${allClassNames.length}');
      return allClassNames;
    }
    var files = dirFils(filePath);
    for (var file in files) {
      if (file.path.contains('/generated/')) continue;
      if (!file.path.endsWith('.dart')) continue;
      String contents = await readFileAsString(file.path);
      if (contents.isEmpty) continue;
      final RegExp classReg = RegExp(r'^class \b\w+\b', multiLine: true);
      print('starting...${files.indexOf(file)}/${files.length},$file');
      await Future.forEach<RegExpMatch>(classReg.allMatches(contents), (match) async {
        String matchClass = match.group(0)!;
        String className = matchClass.substring(6);
        allClassNames.add(className);
      });
    }
    allClassPath.writeAsString(allClassNames.join('\n'));
    print('end findAllClassNames count:${allClassNames.length}');
    return allClassNames;
  }

  // 添加垃圾代码
  Future<void> generateSpamCode(String filePath) async {
    if (filePath.contains('/generated/')) return;
    if (FileSystemEntity.isDirectorySync(filePath)) {
      var listSync = Directory(filePath).listSync();
      for (var file in listSync) {
        await generateSpamCode(file.path);
      }
    }else {
      // 在每个方法的后面添加类似的垃圾方法：原来的方法+随机生成的
      if (!filePath.endsWith('.dart')) return;
      String contents = await readFileAsString(filePath);
      if (contents.isEmpty) return;
      final RegExp pattern = RegExp(r'^ +'
      r'(void|Widget|Stream(<\w+>)?|Future(<\w+>)?'
      r'|List(<\w+>)?|Map(<\w+>)?|String|bool|int)'
      r' \w+\(.*\) ((async\*?) )?\{',multiLine:true);
      var resultReg = RegExp(r'\b(void|Widget|Stream(<\w+>)?|Future(<\w+>)?|List(<\w+>)?|Map(<\w+>)?|String|bool|int)');
      print('starting...$filePath');

      String newContents = contents.toString();
      int appendIndex = 0;
      int lastEnd = 0;
      pattern.allMatches(contents).forEach((match) {

        if (match.groupCount > 0) {
          String matchFunc = match.group(0)!;
          print(matchFunc);
          int end = getOutermostCurlyBraceEnd(contents, '{', '}', match.end-1);
          // print(contents.substring(match.start, end));
          // 是独立的方法，方法里面镶嵌方法就不做处理了
          if (contents.substring(end, end+1) == '\n' && end > lastEnd) {
            int nameIndex = matchFunc.indexOf('(');
            String newFunc = '\n' + matchFunc.replaceRange(nameIndex, nameIndex, "${randomString(5)}$funcIdentifier") + funcInputString;
            print("$newFunc");
            newFunc = newFunc.replaceFirst(resultReg, 'void');
            newFunc = newFunc.replaceFirst(RegExp(r'(async\*?)'), '');
            end += appendIndex;
            newContents = newContents.replaceRange(end, end, newFunc);
            appendIndex += newFunc.length;
            lastEnd = end;
          }
        }

      });
      File(filePath).writeAsString(newContents);
    }

  }

  // 删除垃圾代码
  Future<void> generateDeleteSpamCode(String filePath) async {
    if (filePath.contains('/generated/')) return;
    if (FileSystemEntity.isDirectorySync(filePath)) {
      var listSync = Directory(filePath).listSync();
      for (var file in listSync) {
        await generateDeleteSpamCode(file.path);
      }
    }else {
      // 在每个方法的后面添加类似的垃圾方法：原来的方法+随机生成的
      if (!filePath.endsWith('.dart')) return;
      String contents = await readFileAsString(filePath);
      if (contents.isEmpty) return;
      final RegExp pattern = RegExp(r'^ +'
      r'(void|Widget|Stream(<\w+>)?|Future(<\w+>)?'
      r'|List(<\w+>)?|Map(<\w+>)?|String|bool|int)'
      r' \w+('
      '$funcIdentifier'
      r')\(.*\) ((async\*?) )?\{',multiLine:true);
      print('starting...$filePath');

      String newContents = contents.toString();
      int appendIndex = 0;
      int lastEnd = 0;
      pattern.allMatches(contents).forEach((match) {

        if (match.groupCount > 0) {
          String matchFunc = match.group(0)!;
          print(matchFunc);
          int end = getOutermostCurlyBraceEnd(contents, '{', '}', match.end-1);
          // print(contents.substring(match.start, end));
          // 是独立的方法，方法里面镶嵌方法就不做处理了
          if (contents.substring(end, end+1) == '\n' && end > lastEnd) {
            newContents = newContents.replaceAll("\n$matchFunc$funcInputString", "");
            lastEnd = end;
          }
        }

      });
      File(filePath).writeAsString(newContents);
    }

  }

  // 删除注释
  Future<void>  deleteComments(String filePath) async {
    if (filePath.contains('/generated/')) return;
    if (FileSystemEntity.isDirectorySync(filePath)) {
      var listSync = Directory(filePath).listSync();
      for (var file in listSync) {
        await deleteComments(file.path);
      }
    }else {
      // 在每个方法的后面添加类似的垃圾方法：原来的方法+随机生成的
      if (!filePath.endsWith('.dart')) return;
      String contents = await readFileAsString(filePath);
      if (contents.isEmpty) return;
      print('starting...$filePath');
      String newContents = contents.toString();
      newContents = newContents.replaceAll(RegExp(r'([^:/;,\"])//.*'), '');//
      newContents = newContents.replaceAll(RegExp(r'^//.*',multiLine:true), '');//
      // // 多重/**/注解无法检测，需要手动处理
      // // newContents = newContents.replaceAll(RegExp(r'[^\*]/\*{1,2}[\s\S]*?\*/'), ''); /**/
      int start = -1;
      do {
        start = newContents.indexOf('/*');
        if (start > 0) {
          int end = getOutermostCurlyBraceEnd(newContents, '/*', '*/', start);
          print('starting...$filePath,$start,$end, ${newContents.length}');
          newContents = newContents.replaceRange(start, end, '');
        }
      } while (start > 0);
      newContents = newContents.replaceAll(RegExp(r'^\s*\n',multiLine:true), ''); // 空白行
      File(filePath).writeAsString(newContents);
    }

  }

  List<FileSystemEntity> dirFils(String filePath) {

    String file = filePath;
    List<FileSystemEntity> files = [];

    if (!FileSystemEntity.isDirectorySync(file)) {
      files.add(File(file));
    }else {
      var listSync = Directory(file).listSync(recursive:true);
      for (var element in listSync) {
        if (!FileSystemEntity.isDirectorySync(element.path) &&
            !element.path.contains('/generated/')) {
          files.add(element);
        }
      }
    }
    print('dirFils: $filePath, ${files.length}');
    return files;

  }

  // 匹配一个整个{}方法代码
  int getOutermostCurlyBraceEnd(String content, String start, String end, int startIndex) {
    int braceCount = -1;
    int endIndex = content.length - start.length;
    for (int i=startIndex; i<=endIndex; i++) {
      String c = content.substring(i, i+start.length);
      if (c == start) {
        braceCount = ((braceCount == -1) ? 0 : braceCount) + 1;
      }else if (c == end) {
        braceCount--;
      }
      if (braceCount == 0) {
        endIndex = i+end.length;
        break;
      }
    }
    return endIndex;
  }

  Future<String> readFileAsString(String path) async {
    String contents = '';
    var file = File(path);
    if (file.existsSync() && !path.split('/').last.startsWith('.')) {
      contents = await file.readAsString();
    }
    return contents;
  }

  static const String kRandomAlphabet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";

  String randomString(int length) {
    String random = '';
    for (int i=0; i<length; i++) {
      random = random + kRandomAlphabet[toRandomMax(kRandomAlphabet.length)];
    }
    return random;
  }

  int toRandomMax(int max) {
    Random random = Random.secure();
    int randomInt = random.nextInt(max);
    return randomInt;
  }

  //循环获取缓存大小
  static Future<int> getTotalSizeOfFilesInDir(final FileSystemEntity file) async {
    //  File
    if (file is File && file.existsSync()) {
      int length = await file.length();
      return length;
    }
    if (file is Directory && file.existsSync()) {
      List children = file.listSync();
      int total = 0;
      if (children.isNotEmpty) {
        for (final FileSystemEntity child in (children as Iterable<
            FileSystemEntity>)) {
          total += await getTotalSizeOfFilesInDir(child);
        }
      }
      return total;
    }
    return 0;
  }

}
