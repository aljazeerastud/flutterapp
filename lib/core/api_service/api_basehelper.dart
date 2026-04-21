import 'dart:developer';
import 'dart:io';
import 'package:awa/core/api_service/error_helper.dart';
import 'package:dio/dio.dart';
import 'package:awa/core/api_service/exceptions.dart';
import 'package:awa/core/storage/data/storage.dart';
import 'package:awa/injection_container.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

enum ApiEnvironment { primary, secondary }

class ApiBaseHelper {
  static const String primaryBaseUrl = "https://haya.taxi/api/";
  static const String secondaryBaseUrl = "https://maps.googleapis.com/maps/api/place/";

  static final ApiBaseHelper _instance = ApiBaseHelper._internal();
  final Map<ApiEnvironment, Dio> _dioInstances = {};

  factory ApiBaseHelper({Dio? dio, ApiEnvironment environment = ApiEnvironment.primary}) {
    if (dio != null) {
      _instance._dioInstances[environment] = dio;
    } else {
      _instance._initializeDio(environment);
    }
    return _instance;
  }

  ApiBaseHelper._internal();

  void _initializeDio(ApiEnvironment environment) {
    final baseUrl = _getBaseUrl(environment);
    _dioInstances[environment] = Dio(
      BaseOptions(baseUrl: baseUrl, headers: _defaultHeaders()),
    )..interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      ));
  }

  String _getBaseUrl(ApiEnvironment environment) {
    switch (environment) {
      case ApiEnvironment.primary:
        return primaryBaseUrl;
      case ApiEnvironment.secondary:
        return secondaryBaseUrl;
    }
  }

  Dio getDio(ApiEnvironment environment) {
    if (!_dioInstances.containsKey(environment)) {
      _initializeDio(environment);
    }
    return _dioInstances[environment]!;
  }

  void updateLocaleInHeaders(String locale, {ApiEnvironment? environment}) {
    if (environment != null) {
      getDio(environment).options.headers['Accept-Language'] = locale;
    } else {
      for (var dio in _dioInstances.values) {
        dio.options.headers['Accept-Language'] = locale;
      }
    }
  }

  static Map<String, String> _defaultHeaders() => {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'app-type': 'client',
      };

  Future<T> _performRequest<T>(
    Future<Response<T>> Function() request, {
    required ApiEnvironment environment,
  }) async {
    try {
      final dio = getDio(environment);
      String? token = await sl<Storage>().getToken();
      if (token != null) {
        dio.options.headers['Authorization'] = 'Bearer $token';
      }
      final response = await request();
      return response.data!;
    } on DioException catch (e) {
      log('Request error: $e');
      throw ErrorHelper.handleDioError(e);
    } on SocketException {
      throw NetworkException('No Internet connection');
    } catch (e) {
      log('Unexpected error: $e');
      throw AppException('Unexpected error occurred');
    }
  }

  Future<T> get<T>({
    required String url,
    Map<String, dynamic>? queryParameters,
    ApiEnvironment environment = ApiEnvironment.primary,
  }) async {
    return _performRequest<T>(
      () => getDio(environment).get<T>(url, queryParameters: queryParameters),
      environment: environment,
    );
  }

 Future<T> post<T>({
  required String url,
  dynamic body, // Accepts Map<String, dynamic> or FormData
  ApiEnvironment environment = ApiEnvironment.primary,
}) async {
  return _performRequest<T>(
    () => getDio(environment).post<T>(url, data: body),
    environment: environment,
  );
}

Future<T> patch<T>({
  required String url,
  dynamic body, // Accepts Map<String, dynamic> or FormData
  ApiEnvironment environment = ApiEnvironment.primary,
}) async {
  return _performRequest<T>(
    () => getDio(environment).patch<T>(url, data: body),
    environment: environment,
  );
}


  Future<T> put<T>({
    required String url,
    required Map<String, dynamic> body,
    ApiEnvironment environment = ApiEnvironment.primary,
  }) async {
    return _performRequest<T>(
      () => getDio(environment).put<T>(url, data: body),
      environment: environment,
    );
  }

  Future<T> delete<T>({
    required String url,
    ApiEnvironment environment = ApiEnvironment.primary,
  }) async {
    return _performRequest<T>(
      () => getDio(environment).delete<T>(url),
      environment: environment,
    );
  }
}
