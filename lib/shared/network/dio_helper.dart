import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:awa/component/app_constants.dart';

class ErrorHandler {
  static void showError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 3),
      ),
    );
  }
  static void showResult(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 3),
      ),
    );
  }
}

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: AppConstants.base_url,
      receiveDataWhenStatusError: true,
      followRedirects: false,
      validateStatus: (status) => status! < 500,
    ));
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
    required BuildContext context, // Pass BuildContext for showing messages
  }) async {
    dio.options.headers = {
      'Authorization': "Bearer $token" ?? 'test',
    };

    try {
      print("uri -- ${AppConstants.base_url+url}");
      print("header -- ${ dio.options.headers}");
      return await dio.get(url, queryParameters: query);
    } on DioException catch (error) {
      _handleDioError(error, context);
      rethrow;
    } catch (error) {
      ErrorHandler.showError(context, "حدث خطأ غير متوقع. الرجاء المحاولة مرة أخرى.");
      rethrow;
    }
  }
  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
    required BuildContext context,
  }) async {

    dio.options.headers = {
      'lang': lang,
      'Authorization': "Bearer $token" ?? 'test',
      'Content-Type': 'application/json',
    };

    try {
      print("uri -- ${AppConstants.base_url+url}");

      return await dio.post(url, queryParameters: query, data: data);
    } on DioException catch (error) {
      _handleDioError(error, context);
      rethrow;
    } catch (error) {
      ErrorHandler.showError(context, "حدث خطأ غير متوقع. الرجاء المحاولة مرة أخرى.");
      rethrow;
    }
  }

  static Future<Response> postDataFormat({
    required String url,
    required FormData data,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
    required BuildContext context,
  }) async {
    dio.options.headers = {
      'lang': lang,
      'Authorization': "Bearer $token" ?? 'test',
      'Content-Type': 'multipart/form-data',
      'Accept': 'application/json',
    };

    try {
      return await dio.post(url, queryParameters: query, data: data);
    } on DioException catch (error) {
      _handleDioError(error, context);
      rethrow;
    } catch (error) {
      ErrorHandler.showError(context, "حدث خطأ غير متوقع. الرجاء المحاولة مرة أخرى.");
      rethrow;
    }
  }

  static Future<Response> putData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
    required BuildContext context,
  }) async {
    dio.options.headers = {
      'lang': lang,
      'Authorization': "Bearer $token" ?? 'test',
      'Content-Type': 'application/json',
    };

    try {
      print("uri -- ${AppConstants.base_url+url}");

      return await dio.put(url, queryParameters: query, data: data);
    } on DioException catch (error) {
      _handleDioError(error, context);
      rethrow;
    } catch (error) {
      ErrorHandler.showError(context, "حدث خطأ غير متوقع. الرجاء المحاولة مرة أخرى.");
      rethrow;
    }
  }
  static Future<Response> deleteData({
    required String url,
    // Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
    required BuildContext context,
  }) async {
    dio.options.headers = {
      'lang': lang,
      'Authorization': "Bearer $token" ?? 'test',
      'Content-Type': 'application/json',
    };

    try {
      print("uri -- ${AppConstants.base_url+url}");
      return await dio.delete(url, queryParameters: query);
    } on DioException catch (error) {
      _handleDioError(error, context);
      rethrow;
    } catch (error) {
      ErrorHandler.showError(context, "حدث خطأ غير متوقع. الرجاء المحاولة مرة أخرى.");
      rethrow;
    }
  }

  static void _handleDioError(DioException error, BuildContext context) {
    if (error.type == DioExceptionType.connectionTimeout) {
      ErrorHandler.showError(context, "انتهت مهلة الاتصال. تحقق من اتصالك بالإنترنت.");
    } else if (error.type == DioExceptionType.sendTimeout) {
      ErrorHandler.showError(context, "انتهت مهلة إرسال البيانات.");
    } else if (error.type == DioExceptionType.receiveTimeout) {
      ErrorHandler.showError(context, "انتهت مهلة استلام البيانات.");
    } else if (error.type == DioExceptionType.badCertificate) {
      ErrorHandler.showError(context, "خطأ في الخادم. كود الحالة: ${error.response?.statusCode}");
    } else if (error.type == DioExceptionType.cancel) {
      ErrorHandler.showError(context, "تم إلغاء الطلب.");
    } else{// if (error.type == DioExceptionType.unknown) {
      if (error.error is SocketException) {
        ErrorHandler.showError(context, "لا يوجد اتصال بالإنترنت.");
      } else {
        ErrorHandler.showError(context, "حدث خطأ غير متوقع: ${error.message}");
      }
    }
  }
}