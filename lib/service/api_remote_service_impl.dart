import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:sale_product_app/constants/constant_uri.dart';
import 'package:sale_product_app/data/local/user_data_local.dart';
import 'package:sale_product_app/models/request/Login_request.dart';
import 'package:sale_product_app/models/request/Refresh_token_request.dart';
import 'package:sale_product_app/models/response/ApiBaseResponse.dart';
import 'package:sale_product_app/models/response/Login_response.dart';
import 'package:sale_product_app/service/api_remote_service.dart';
import 'package:http/http.dart' as httpClient;

class ApiRemoteServiceImpl extends ApiRemoteService {
  @override
  Future<ApiBaseResponse> getApi({required String url}) async {
    // TODO: implement getApi
    throw UnimplementedError();
  }

  @override
  Future<ApiBaseResponse> postApi({required String url, required body}) async {
    // print("Intercept call url : $url and request body : $body");
    ApiBaseResponse apiBaseResponse = ApiBaseResponse();
    var response = await httpClient
        .post(
          Uri.parse(url),
          body: body,
          headers: {"Content-Type": "application/json"},
        )
        .timeout(Duration(seconds: 120));
    if (response.statusCode == 200) {
      apiBaseResponse.message = "Success";
      apiBaseResponse.isSuccess = true;
      apiBaseResponse.errorCode = "200";
      apiBaseResponse.data = response.body;
    } else {
      apiBaseResponse.message = "Success";
      apiBaseResponse.isSuccess = false;
      apiBaseResponse.errorCode = "500";
      apiBaseResponse.data = response.body;
    }

    return apiBaseResponse;
  }

  @override
  Future<ApiBaseResponse> postApiToken({
    required String url,
    required requestBody,
  }) async {
    ApiBaseResponse apiBaseResponse = ApiBaseResponse();
    var headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${UserDataLocal.getAccessToken()}",
    };
    var response = await httpClient.post(
      Uri.parse(url),
      headers: headers,
      body: requestBody,
    );
    if (response.statusCode == 401) {
      if (await _refreshToken() == true) {
        return await _retry(url, requestBody);
      }
      else{
        UserDataLocal.removeUserData();
        Get.offAllNamed("/splash");
      }
    } else if (response.statusCode == 200) {
      apiBaseResponse.message = "Success";
      apiBaseResponse.isSuccess = true;
      apiBaseResponse.errorCode = "200";
      apiBaseResponse.data = response.body;
    } else {
      apiBaseResponse.message = "Success";
      apiBaseResponse.isSuccess = false;
      apiBaseResponse.errorCode = "500";
      apiBaseResponse.data = response.body;
    }
    return apiBaseResponse;
  }

  Future<ApiBaseResponse> _retry(String url, dynamic requestBody) async {
    ApiBaseResponse apiBaseResponse = ApiBaseResponse();
    var headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${UserDataLocal.getAccessToken()}",
    };
    var response = await httpClient.post(
      Uri.parse(url),
      headers: headers,
      body: requestBody,
    );
    if (response.statusCode == 200) {
      apiBaseResponse.message = "Success";
      apiBaseResponse.isSuccess = true;
      apiBaseResponse.errorCode = "200";
      apiBaseResponse.data = response.body;
    } else {
      apiBaseResponse.message = "Success";
      apiBaseResponse.isSuccess = false;
      apiBaseResponse.errorCode = "500";
      apiBaseResponse.data = response.body;
    }
    return apiBaseResponse;
  }

  Future<bool> _refreshToken() async {
    if (kDebugMode) {
      print("Call Refresh Token");
    }
    var refreshTokenResponse = await httpClient
        .post(
          Uri.parse(ConstantUri.refreshTokenPath),
          body: jsonEncode(
            RefreshTokenRequest(
              refreshToken: UserDataLocal.getRefreshToken(),
            ).toJson(),
          ),
          headers: {"Content-Type": "application/json"},
        )
        .timeout(Duration(seconds: 120));
    if (refreshTokenResponse.statusCode == 200) {
      var response = LoginResponse.fromJson(
        jsonDecode(refreshTokenResponse.body),
      );
      if (response.user != null) {
        UserDataLocal.saveAccessToken(response.accessToken ?? "");
        UserDataLocal.saveRefreshToken(response.refreshToken ?? "");
        UserDataLocal.saveUserData(response.user!);
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
}
