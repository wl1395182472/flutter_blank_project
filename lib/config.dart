//
// Copyright© 2021 Ti-Ding(上海醍顶信息科技有限公司). All Rights Reserved.
// file         config.dart
// date         2023-01-15
// author       wl1395182472(wl1395182472@gmail.com)
// version      0.1
// brief        配置文件
//

import 'package:logger/logger.dart';

///配置信息类
class Config {
  ///当前日志等级
  static const Level logLevel = Level.debug;

  ///服务器url
  static const String apiHost = 'https://www.baidu.com';

  ///获取location的url
  static const ipApiUrl = 'https://api.ip.sb/geoip';
}
