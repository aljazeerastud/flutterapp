import 'package:awa/component/app_constants.dart';
import 'package:awa/shared/network/api_response.dart';
import 'package:awa/shared/network/dio_helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import 'package:awa/shared/network/exception/api_error_handler.dart';
class AuthRepo{
  static Future<ApiResponse> loginApi(BuildContext context) async {

    try {
      Response response = await DioHelper.getData(
          url: AppConstants.login,
          context: context);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      if (e.toString().contains("SocketException")) {
        return ApiResponse.withError("no internet");
      } else {
        return ApiResponse.withError(ApiErrorHandler.getMessage(e));
      }
    }
  }

}