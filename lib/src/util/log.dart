//
// Copyright© 2021 Ti-Ding(上海醍顶信息科技有限公司). All Rights Reserved.
// file         log.dart
// date         2023-01-15
// author       wl1395182472(wl1395182472@gmail.com)
// version      0.1
// brief        打印日志的工具类文件
//

import 'package:logger/logger.dart';

import '../../config.dart';

///打印日志的工具类
final sLog = Logger(
  printer: PrettyPrinter(
    methodCount: 0,
    printEmojis: false,
    printTime: true,
  ),
  level: Config.logLevel,
);
