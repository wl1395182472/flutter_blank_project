//
// Copyright© 2021 Ti-Ding(上海醍顶信息科技有限公司). All Rights Reserved.
// file         app_channel.dart
// date         2023-01-15
// author       wl1395182472(wl1395182472@gmail.com)
// version      0.1
// brief        混合开发通信工具类
//

import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';

///向其他平台的通信
class AppChannel {
  ///通信工具类
  static const MethodChannel channel =
      MethodChannel("flutter_blank_project/app_channel");

  static final _onIOSResumeController = StreamController<void>.broadcast();
  static final _onIOSPauseController = StreamController<void>.broadcast();
  static final _onAndroidPauseController = StreamController<void>.broadcast();
  static final _onAndroidResumeController = StreamController<void>.broadcast();

  static Stream<void> onIOSResume = _onIOSResumeController.stream;
  static Stream<void> onIOSPause = _onIOSPauseController.stream;
  static Stream<void> onAndroidPause = _onAndroidPauseController.stream;
  static Stream<void> onAndroidResume = _onAndroidResumeController.stream;

  ///初始化flutter接收其他平台的通信
  static init() {
    channel.setMethodCallHandler((call) async {
      switch (call.method) {
        case 'ios_pause':
          _onIOSPauseController.add(null);
          break;
        case 'ios_resume':
          _onIOSResumeController.add(null);
          break;
        case 'android_onResume':
          _onAndroidResumeController.add(null);
          break;
        case 'android_onPause':
          _onAndroidPauseController.add(null);
          break;
      }
      return null;
    });
  }

  ///销毁
  static dispose() {
    _onIOSResumeController.close();
    _onIOSPauseController.close();
    _onAndroidPauseController.close();
    _onAndroidResumeController.close();
  }

  static Future appReview() async {
    return channel.invokeMethod("appReview");
  }

  static Future quickAppReview() async {
    if (Platform.isIOS) {
      return channel.invokeMethod("quickAppReview");
    }
  }

  static Future deleteFile(String path) async {
    if (Platform.isAndroid) {
      await channel.invokeMethod("deleteFile", {"path": path});
    }
    return Future.error('requestIDFA only support Android');
  }

  static Future<void> requestIDFA() {
    if (Platform.isIOS) {
      return channel.invokeMethod("requestIDFA");
    }
    return Future.error('requestIDFA only support IOS');
  }
}
