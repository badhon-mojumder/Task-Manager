import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:task_manager/task_manager/controller/auth_controller.dart';
import 'package:task_manager/task_manager/models/api_response.dart';

class ApiCaller {
  static Future<ApiResponse> getRequest({required String url}) async {
    final response = await http.get(Uri.parse(url),
        headers: {
      'token' : AuthController.userToken ?? ''
        }
    );

    print('$url');
    print('${response.body}');

    if (response.statusCode == 200) {
      return ApiResponse(responseCode: response.statusCode,
          responseData: jsonDecode(response.body),
          isSuccess: true);
    }
    else {
      return ApiResponse(responseCode: response.statusCode,
          responseData: jsonDecode(response.body),
          isSuccess: false);
    }
  }

  static Future<ApiResponse> postRequest(
      {required String url, Map<String, dynamic>? body}) async {
    final response = await http.post(Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'token' : AuthController.userToken ?? ''
        },
        body: body != null ? jsonEncode(body) : null

    );

    print('$url');
    print('${response.body}');

    if (response.statusCode == 200 || response.statusCode == 201) {
      return ApiResponse(responseCode: response.statusCode,
          responseData: jsonDecode(response.body),
          isSuccess: true);
    }
    else {
      return ApiResponse(responseCode: response.statusCode,
          responseData: jsonDecode(response.body),
          isSuccess: false);
    }
  }
}