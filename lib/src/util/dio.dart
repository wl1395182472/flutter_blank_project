//
// Copyright© 2021 Ti-Ding(上海醍顶信息科技有限公司). All Rights Reserved.
// file         dio.dart
// date         2023-01-15
// author       wl1395182472(wl1395182472@gmail.com)
// version      0.1
// brief        插件dio使用http请求
//

import 'dart:io';

import 'package:dio/dio.dart';

import '../../config.dart';

///dio工具类
class DioUtil {
  ///打开url超时（毫秒）
  static const int _connectTimeout = 5000;

  ///每当来自响应流的两个事件之间超过[receiveTimeout]（以毫秒为单位）时
  ///
  ///[Dio]将抛出[DioErrorType.REIVE_TIMEOUT]的[DioError]
  ///
  ///注意：这不是接收时间限制
  static const int _receiveTimeout = 10000;

  ///dio工具类定义的变量
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: Config.apiHost,
      connectTimeout: _connectTimeout,
      receiveTimeout: _receiveTimeout,
      headers: {HttpHeaders.userAgentHeader: ''},
      responseType: ResponseType.json,
      validateStatus: (status) => true,
    ),
  );

  ///dio的get请求
  static Future<Response> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onReceiveProgress,
  }) async {
    final Response response = await _dio.get(
      url,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    );
    return response;
  }

  ///dio的post请求
  static Future<Response> post(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
  }) async {
    final Response response = await _dio.post(
      url,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
    return response;
  }
}
