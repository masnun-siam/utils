import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:utils/utils.dart';

class ApiBaseHelper {
  static BaseOptions opts = BaseOptions(
    baseUrl: '',
    responseType: ResponseType.json,
    connectTimeout: 10000.milliSeconds,
    receiveTimeout: 10000.milliSeconds,
  );

  ApiBaseHelper(
      {String baseUrl = '',
      int connectionTimeout = 10000,
      int receiveTimeout = 10000}) {
    opts = BaseOptions(
      baseUrl: baseUrl,
      responseType: ResponseType.json,
      connectTimeout: connectionTimeout.milliSeconds,
      receiveTimeout: receiveTimeout.milliSeconds,
    );
  }

  static Dio createDio() {
    return Dio(opts);
  }

  static Dio addInterceptors(Dio dio) {
    return dio
      ..interceptors.add(
        InterceptorsWrapper(
            onRequest:
                (RequestOptions options, RequestInterceptorHandler handler) =>
                    requestInterceptor(options, handler),
            onError: (DioException e, ErrorInterceptorHandler handler) async {
              log(e.toString());
              handler.next(e);
            }),
      );
  }

  static void requestInterceptor(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // Get your JWT token
    const token = '';
    options.headers.addAll({"Authorization": "Bearer: $token"});
    handler.next(options);
  }

  static final dio = createDio();
  static final baseAPI = addInterceptors(dio);

  Future<Response?> getHTTP(String path,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      Response response =
          await baseAPI.get(path, queryParameters: queryParameters);
      return response;
    } on DioException catch (e) {
      handleError(e);
    }
  }

  Future<Response?> postHTTP(String path, dynamic data,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      Response response = await baseAPI.post(path,
          data: data, queryParameters: queryParameters);
      return response;
    } on DioException catch (e) {
      handleError(e);
    }
  }

  Future<Response?> putHTTP(String path, dynamic data,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      Response response =
          await baseAPI.put(path, data: data, queryParameters: queryParameters);
      return response;
    } on DioException catch (e) {
      handleError(e);
    }
  }

  Future<Response?> deleteHTTP(String path,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      Response response =
          await baseAPI.delete(path, queryParameters: queryParameters);
      return response;
    } on DioException catch (e) {
      throw handleError(e);
    }
  }

  handleError(DioException e) {
    // Handle error
  }
}

sealed class HttpExceptions {}

class NoInternetException extends HttpExceptions {}

class TimeOutException extends HttpExceptions {}

class BadRequestException extends HttpExceptions {}

class UnauthorizedException extends HttpExceptions {}

class NotFoundException extends HttpExceptions {}

class ServerException extends HttpExceptions {}

class UnknownException extends HttpExceptions {}
