//
// Copyright© 2021 Ti-Ding(上海醍顶信息科技有限公司). All Rights Reserved.
// file         home_view.dart
// date         2023-01-15
// author       wl1395182472(wl1395182472@gmail.com)
// version      0.1
// brief        page:home
//

import 'package:flutter/material.dart';
import 'package:flutter_blank_project/config.dart';
import 'package:flutter_blank_project/src/page/home/controller/home_controller.dart';
import 'package:flutter_blank_project/src/util/index.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    super.key,
  });

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeController _homeController = HomeController();

  int _counter = 0;

  void _incrementCounter() {
    _homeController;
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$_counter'),
            ElevatedButton(
              onPressed: () {
                BrowserUtil.openAppBrowser(
                  context: context,
                  url: 'https://www.baidu.com/',
                );
              },
              child: const Text('打开百度'),
            ),
            ElevatedButton(
              onPressed: () async {
                final result = await DioUtil.post(Config.ipApiUrl);
                sLog.e('result:$result');
              },
              child: const Text('请求url'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
