import 'package:dio/dio.dart';
import 'package:awa/core/api_service/api_response.dart';
import 'package:awa/core/api_service/exceptions.dart';

class ErrorHelper {
  static String handleErrors(Map<String, dynamic> errorData) {
    try {
      final apiResponse = ApiResponse.fromJson(errorData);
      if (apiResponse.errors?.isNotEmpty == true) {
        final firstError = apiResponse.errors!.first;
        if (firstError.field != null) {
          throw ValidationException(
            firstError.message,
            validationErrors: {firstError.field!: firstError.message},
          );
        }
        return firstError.message;
      }
      return 'Unknown error occurred';
    } catch (e) {
      if (e is ValidationException) rethrow;
      return 'Error processing server response';
    }
  }

  static AppException handleDioError(DioException e) {
    switch (e.response?.statusCode) {
      case 400:
        return BadRequestException(_getErrorMessage(e));
      case 401:
        return UnauthorizedException(_getErrorMessage(e));
      case 404:
        return NotFoundException(_getErrorMessage(e));
      case 422:
        final errorData = e.response?.data as Map<String, dynamic>;
        return ValidationException(
          _getErrorMessage(e),
          validationErrors: errorData['errors'] as Map<String, dynamic>?,
        );
      default:
        return ServerException(
          message: 'Unexpected error occurred',
          response: e.response,
        );
    }
  }

  static String _getErrorMessage(DioException e) {
    if (e.response?.data is Map<String, dynamic>) {
      return handleErrors(e.response!.data as Map<String, dynamic>);
    }
    return e.message ?? 'Unexpected error occurred';
  }
}