import 'package:awa/core/api_service/api_error.dart';

class ApiResponse<T> {
  final T? data;
  final List<ApiError>? errors;

  ApiResponse({this.data, this.errors});

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      errors: json['errors'] != null
          ? List<ApiError>.from(
              json['errors'].map((error) => ApiError.fromJson(error)))
          : null,
    );
  }
}