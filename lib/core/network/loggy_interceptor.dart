import 'package:dio/dio.dart';
import 'package:loggy/loggy.dart';

class LoggyInterceptor extends Interceptor with UiLoggy {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    loggy.debug('REQUEST[${options.method}] => PATH: ${options.path}');
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    loggy.debug(
        'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}\n'
            'DATA: ${response.data}'
    );
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    loggy.debug('ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    super.onError(err, handler);
  }
}