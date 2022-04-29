import 'dart:io';

import 'package:dio/dio.dart';
import 'package:food_yours_customer/api/app_response.dart';
import 'package:food_yours_customer/resources/integers.dart';

class ApiClient {
  final Dio _dio;
  final baseUrl = "https://foodyours.com/foodyours8726.API";

  ApiClient(this._dio);

  void setExtraHeaders(Map<String, dynamic> newHeaders) {
    Map<String, dynamic> existingHeaders = this._dio.options.headers;
    newHeaders.forEach((key, value) =>
        existingHeaders.update(key, (_) => value, ifAbsent: () => value));
    this._dio.options.headers = existingHeaders;
  }

  void setInterceptors() {
    dio!
      ..interceptors.add(InterceptorsWrapper(onRequest: (RequestOptions options,
          RequestInterceptorHandler requestInterceptorHandler) {
        "======================================================================>";
        print("REQUEST HEADERS ==============>  ${options.headers}");
        print("REQUEST URI ==============>  ${options.uri}");
        print("REQUEST DATA ==============>  ${options.data}");
        "======================================================================>";
        return requestInterceptorHandler.next(options); //continue
      }, onResponse:
          (Response<dynamic> response, ResponseInterceptorHandler handler) {
        "======================================================================>";
        print("RESPONSE DATA ==============>  ${response.data}");
        print("RESPONSE HEADERS ==============>  ${response.headers}");
        print("RESPONSE STATUSCODE ==============>  ${response.statusCode}");
        print(
            "RESPONSE STATUSMESSAGE ==============>  ${response.statusMessage}");
        "======================================================================>";
        return handler.next(response); // continue
      }, onError: (DioError e, handler) {
        print("RESPONSE ERROR ==============>  ${e.message}");
        return handler.next(e); //continue
      }));
  }

  void setBaseOptions() {
    _dio.options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: Integers.connectionTimeOut,
      headers: {"content-Type": "application/json"},
    );
  }

  Response? handleError(DioError e) {
    print("the error ${e.error} ");
    print("the response ${e.response} ");
    print("the message ${e.message} ");

    Response? response;
    switch (e.type) {
      case DioErrorType.cancel:
        response = Response(
            data: localResponse("Request cancelled"),
            statusCode: 000,
            requestOptions: RequestOptions(path: ''));
        break;
      case DioErrorType.connectTimeout:
        response = Response(
            data: localResponse("Network connection timed out"),
            statusCode: 000,
            requestOptions: RequestOptions(path: ''));
        break;
      case DioErrorType.receiveTimeout:
        response = Response(
            data: localResponse("Network connection timed out"),
            statusCode: 000,
            requestOptions: RequestOptions(path: ''));
        break;
      case DioErrorType.sendTimeout:
        response = Response(
            data: localResponse("Network connection timed out"),
            statusCode: 000,
            requestOptions: RequestOptions(path: ''));
        break;
      case DioErrorType.other:
        if (e.error is SocketException) {
          response = Response(
              data: localResponse("Please check your network connection"),
              statusCode: 000,
              requestOptions: RequestOptions(path: ''));
        } else if (e.error is HttpException) {
          response = Response(
              data: localResponse("Network connection issue"),
              statusCode: 000,
              requestOptions: RequestOptions(path: ''));
        } else {
          response = Response(
              data: localResponse("An error occurred, please try again"),
              statusCode: 000,
              requestOptions: RequestOptions(path: ''));
        }
        break;
      default:
        if (e.response?.data.runtimeType == String ||
            e.error.toString().contains("404")) {
          response = Response(
              data: localResponse("An error occurred, please try again"),
              statusCode: 000,
              requestOptions: RequestOptions(path: ''));
        } else if (e.response?.data.runtimeType == String ||
            e.error.toString().contains("400") &&
                e.requestOptions.baseUrl
                    .contains("https://digitallabrat.net/singlebillers/api")) {
          response = Response(
              data: localResponse(e.response?.data?["responseDescription"],
                  e.response?.data?["responseCode"]),
              statusCode: e.response?.statusCode ?? 000,
              requestOptions: RequestOptions(path: ''));
        } else {
          print("came in here");
          response = Response(
              data: localResponse(e.response?.data?["message"],
                  e.response?.data?["responseCode"]),
              statusCode: e.response?.statusCode ?? 000,
              requestOptions: RequestOptions(path: ''));
        }
    }
    return response;
  }

  get dio => _dio;

  ApiClient clone() => ApiClient(this._dio);
}
