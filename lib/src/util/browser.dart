//
// Copyright© 2021 Ti-Ding(上海醍顶信息科技有限公司). All Rights Reserved.
// file         browser.dart
// date         2023-01-15
// author       wl1395182472(wl1395182472@gmail.com)
// version      0.1
// brief        打开浏览器的工具类文件
//

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import '../global_widget/index.dart';
import 'index.dart';

class BrowserUtil {
  static ChromeSafariBrowser browser = MyChromeSafariBrowser();

  ///打开app内嵌浏览器页面
  static Future openAppBrowser({
    required BuildContext context,
    required String url,
  }) async {
    return await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const MyWebView(),
        settings: RouteSettings(arguments: {'url': url}),
      ),
    );
  }

  ///打开手机系统默认浏览器
  static Future openSystemBrowser(String url) async {
    return await browser.open(
      url: Uri.parse(url),
      options: ChromeSafariBrowserClassOptions(
        android: AndroidChromeCustomTabsOptions(
          shareState: CustomTabsShareState.SHARE_STATE_DEFAULT,
        ),
        ios: IOSSafariOptions(barCollapsingEnabled: true),
      ),
    );
  }
}

class MyChromeSafariBrowser extends ChromeSafariBrowser {
  @override
  void onOpened() {
    sLog.d("ChromeSafari browser opened");
  }

  @override
  void onCompletedInitialLoad() {
    sLog.d("ChromeSafari browser initial load completed");
  }

  @override
  void onClosed() {
    sLog.d("ChromeSafari browser closed");
  }
}
