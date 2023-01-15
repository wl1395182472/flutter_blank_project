//
// Copyright© 2021 Ti-Ding(上海醍顶信息科技有限公司). All Rights Reserved.
// file         my_web_view.dart
// date         2023-01-15
// author       wl1395182472(wl1395182472@gmail.com)
// version      0.1
// brief        app内置浏览器页面
//

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import '../util/index.dart';

class MyWebView extends StatefulWidget {
  const MyWebView({super.key});

  @override
  State<MyWebView> createState() => _MyWebViewState();
}

class _MyWebViewState extends State<MyWebView> {
  ///url的标题
  String _title = '';

  ///url的内容
  String _url = '';

  ///加载进度
  double _progress = 0.0;

  /// function:  [initData]
  ///
  /// param:     [inAppWebViewController]:由[InAppWebView]推送事件onLoadStart获取controller
  ///
  /// return:    [null]
  ///
  /// brief:      获取路由得到的[arguments]解析获取url由[inAppWebViewController]加载
  void initData(InAppWebViewController inAppWebViewController) async {
    final arguments = ModalRoute.of(context)?.settings.arguments;
    if (arguments != null && arguments is Map<String, String>) {
      final map = arguments;
      if (map['url'] != null) {
        _title = map["url"]!;
        _url = map["url"]!;
        await inAppWebViewController.loadUrl(
          urlRequest: URLRequest(url: Uri.parse(_url)),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _title,
          style: TextStyle(
            color: Theme.of(context).textTheme.bodyText2?.color,
            fontSize: 30.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      backgroundColor: Theme.of(context).cardColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _progress < 1.0
              ? Container(
                  width: MediaQuery.of(context).size.width * _progress,
                  height: 10.0,
                  color: Colors.greenAccent,
                )
              : const SizedBox(height: 10.0),
          Expanded(
            child: InAppWebView(
              initialUrlRequest: URLRequest(url: Uri.parse(_url)),
              initialOptions: InAppWebViewGroupOptions(
                android: AndroidInAppWebViewOptions(),
                ios: IOSInAppWebViewOptions(),
                crossPlatform: InAppWebViewOptions(
                  supportZoom: false,
                  useShouldOverrideUrlLoading: false,
                  clearCache: true,
                  disableVerticalScroll: false,
                  javaScriptEnabled: true,
                ),
              ),
              onLoadStart: (
                InAppWebViewController webViewController,
                Uri? uri,
              ) {
                sLog.d("onLoadStart $uri");
                if (_url.isEmpty) {
                  initData(webViewController);
                }
              },
              onLoadStop: (
                InAppWebViewController webViewController,
                Uri? uri,
              ) {
                webViewController.getTitle().then(
                  (value) {
                    sLog.d("onLoadStop $uri");
                    if (value != null) {
                      setState(() {
                        _title = value;
                      });
                    }
                  },
                );
              },
              onProgressChanged: (
                InAppWebViewController webViewController,
                int progress,
              ) {
                if (progress != _progress) {
                  setState(() {
                    _progress = progress / 100;
                  });
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
