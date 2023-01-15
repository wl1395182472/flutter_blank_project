//
// Copyright© 2021 Ti-Ding(上海醍顶信息科技有限公司). All Rights Reserved.
// file         app.dart
// date         2023-01-15
// author       wl1395182472(wl1395182472@gmail.com)
// version      0.1
// brief        material app
//

import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import 'src/page/splash/view/splash_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) => ResponsiveWrapper.builder(
        child,
        maxWidth: 1200,
        minWidth: 480,
        defaultScale: true,
        breakpoints: [
          const ResponsiveBreakpoint.resize(480, name: MOBILE),
          const ResponsiveBreakpoint.autoScale(800, name: TABLET),
          const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
        ],
        background: Container(
          color: const Color(0xFFF5F5F5),
        ),
      ),
      home: const SplashView(),
    );
  }
}
