import 'dart:async';
import 'dart:io';

import 'package:arab_therapy_task/core/consts/end_points_constants.dart';
import 'package:arab_therapy_task/core/consts/storage_constants.dart';
import 'package:arab_therapy_task/core/services/local_storage_service.dart';
import 'package:arab_therapy_task/core/widgets/dialog_widgets.dart';
import 'package:arab_therapy_task/models/api_response.dart';
import 'package:arab_therapy_task/features/user_controller.dart';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';

class HttpClientService {
  static final String _baseUrl = Uri.encodeFull(AppApiConstants.baseUrl);

  static Future<ApiResponse> sendRequest({
    required String endPoint,
    required HttpRequestTypes requestType,
    dynamic data,
    Map<String, String>? queryParameters,
    Map<String, String>? header,
    Function(int sent, int total)? onProgress,
  }) async {
    ApiResponse? response;
      if (requestType == HttpRequestTypes.post) {
        response = await post(endPoint, formData: data, header: header, onProgress: onProgress);
      } else if (requestType == HttpRequestTypes.get) {
        response = await get(endPoint, queryParameters: queryParameters, header: header);
      } else if (requestType == HttpRequestTypes.delete) {
        response = await delete(endPoint, formData: data, header: header);
      } else if (requestType == HttpRequestTypes.put) {
        response = await put(endPoint, formData: data, header: header);
      } else if (requestType == HttpRequestTypes.patch) {
        response = await patch(endPoint, formData: data, header: header);
      }
      print("TESTAPI::${response?.statusCode}::${response?.successFlag}::${response?.error}::${response?.body}");


    return response!;
  }

  static Future<dio.BaseOptions> getBaseOptions({Map<String, String>? header, int? timeout}) async {
    header ??= <String, String>{};
    String? token =await LocalStorageService.getData(key: AppStorageKeys.userToken, type: DataType.string);

    print("ChECK::Token::$token");
    token==null?
    header.addAll({
      "Accept": "application/json",
      "Content-type": "application/json",
      "Accept-Language": Get.locale?.languageCode ?? "en",
    }): header.addAll({
      "Accept": "application/json",
      "Content-type": "application/json",
      "Accept-Language": Get.locale?.languageCode ?? "en",
      "X-Tadreab-Token":token
    });
    return dio.BaseOptions(
      baseUrl: Uri.encodeFull(_baseUrl),
      headers: header,
    );
  }

  static Future<ApiResponse> get(String endPoint,
      {int? timeout, Map<String, String>? header, Map<String, String>? queryParameters}) async {
    try {
      dio.Response response = await dio.Dio(
        await getBaseOptions(timeout: timeout, header: header),
      ).get(
        Uri.encodeFull(endPoint),
        queryParameters: queryParameters,
      );
      //print(response);
      return _buildOut(response);
    } catch (_error) {
      dio.DioError error = _error as dio.DioError;
      if (error.response == null) {
        print("BB::${_error.toString()}");
        return _errorNoResponse(error);
      } else {
        print("AA::${_error.response}");
        return _buildOut(error.response!);
      }
    }
  }

  static Future<ApiResponse> post(String endPoint,
      {dynamic formData,
        Map<String, String>? header,
        int? timeout,
        Map<String, String>? queryParameters,
        Function(int sent, int total)? onProgress}) async {
    // try {
      dio.Response response = await dio.Dio(
        await getBaseOptions(
          timeout: timeout,
          header: header,
        ),
      ).post(
        Uri.encodeFull(endPoint),
        data: formData,
        queryParameters: queryParameters,
        onSendProgress: onProgress,
      );
      return _buildOut(response);
    // } catch (_error) {
    //
    //   dio.DioError error = _error as dio.DioError;
    //   if (error.response == null) {
    //     print("BB::${_error.toString()}");
    //     return _errorNoResponse(error);
    //   } else {
    //     print("AA::${_error.response}");
    //     return _buildOut(error.response!);
    //   }
    // }
  }


  static Future<ApiResponse> patch(String endPoint,
      {dynamic formData,
        Map<String, String>? header,
        int? timeout,
        Map<String, String>? queryParameters,
        Function(int sent, int total)? onProgress}) async {
    try {
      dio.Response response = await dio.Dio(
        await getBaseOptions(
          timeout: timeout,
          header: header,
        ),
      ).patch(
        Uri.encodeFull(endPoint),
        data: formData,
        queryParameters: queryParameters,
        onSendProgress: onProgress,
      );
      return _buildOut(response);
    } catch (_error) {

      dio.DioError error = _error as dio.DioError;
      if (error.response == null) {
        print("BB::${_error.toString()}");
        return _errorNoResponse(error);
      } else {
        print("AA::${_error.response}");
        return _buildOut(error.response!);
      }
    }
  }

  static Future<ApiResponse> delete(String endPoint,
      {dynamic formData, Map<String, String>? header, int? timeout, Map<String, String>? queryParameters}) async {
    try {
      dio.Response response = await dio.Dio(
        await getBaseOptions(
          timeout: timeout,
          header: header,
        ),
      ).delete(
        Uri.encodeFull(endPoint),
        data: formData,
        queryParameters: queryParameters,
      );
      return _buildOut(response);
    } catch (_error) {
      dio.DioError error = _error as dio.DioError;
      if (error.response == null) {
        return _errorNoResponse(error);
      } else {
        return _buildOut(error.response!);
      }
    }
  }

  static Future<ApiResponse> put(String endPoint,
      {dynamic formData, Map<String, String>? header, int? timeout, Map<String, String>? queryParameters}) async {
    try {
      dio.Response response = await dio.Dio(
        await getBaseOptions(
          timeout: timeout,
          header: header,
        ),
      ).put(
        Uri.encodeFull(endPoint),
        data: formData,
        queryParameters: queryParameters,
      );
      return _buildOut(response);
    } catch (_error) {
      dio.DioError error = _error as dio.DioError;
      if (error.response == null) {
        return _errorNoResponse(error);
      } else {
        return _buildOut(error.response!);
      }
    }
  }

  static ApiResponse _buildOut(dio.Response response) {
    ApiResponse apiResponse = ApiResponse();
    if (response.data['code'] == 200) {
      apiResponse.statusCode = response.data['code'];
      apiResponse.successFlag = true;
      apiResponse.error =  response.data['message'];
      apiResponse.body =response.data['data'];
    }
    else if (response.data['code'] == 422) {
      if (response.data is Map<String, dynamic>) {
        apiResponse.statusCode = response.data['code'];
        apiResponse.successFlag = false;
        apiResponse.error = response.data['error'];
      } else {
        apiResponse.statusCode = response.data['code'];
        apiResponse.successFlag = false;
        apiResponse.error = response.data.toString();
      }
    } else if (response.data['code'] == 403) {
      apiResponse.statusCode = response.data['code'];
      apiResponse.successFlag = false;
      apiResponse.error = response.data['error'];
    } else if (response.data['code'] == 401) {
      apiResponse.statusCode = response.data['code'];
      apiResponse.successFlag = false;
      apiResponse.error = "Unauthorized";
    } else {
      apiResponse.statusCode = response.statusCode;
      apiResponse.successFlag = false;
      apiResponse.error = "There is an error";
      apiResponse.body = response.data['Results'] ?? response.data;
    }

    return apiResponse;
  }

  static ApiResponse _errorNoResponse(dio.DioError error) {
    if (error.error is SocketException) {
      return ApiResponse(statusCode: 502, error: "تأكد من إتصالك بالإنترنت");
    } else if (error is TimeoutException) {
      return ApiResponse(statusCode: 504, error: "Request execution time reached the limit");
    } else {
      return ApiResponse(statusCode: 500, error: error.toString());
    }
  }

  static String convertResponseErrorsToString(ApiResponse response) {
    String errorsMessage = '';
    Map<String, dynamic> messagesList = response.error;
    messagesList.forEach((key, value) {
      if (value is List) {
        for (var item in value) {
          errorsMessage += '$item \n';
        }
      } else {
        errorsMessage += '$value \n';
      }
    });
    return errorsMessage;
  }
}

enum HttpRequestTypes {
  post,
  delete,
  put,
  get,
  patch,
}
