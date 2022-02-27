import 'package:dio/dio.dart';
import 'package:flutter_demo_app/core/network/loggy_interceptor.dart';

class RestClient {
  final dio = Dio();

  RestClient() {
    dio.interceptors.add(LoggyInterceptor());
    dio.options.contentType = "application/json";
  }
}