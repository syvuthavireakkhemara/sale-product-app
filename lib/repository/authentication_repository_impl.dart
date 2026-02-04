import 'dart:convert';

import 'package:sale_product_app/constants/constant_uri.dart';
import 'package:sale_product_app/models/request/Login_request.dart';
import 'package:sale_product_app/models/request/Register_request.dart';
import 'package:sale_product_app/models/response/ApiBaseResponse.dart';
import 'package:sale_product_app/models/response/Login_response.dart';
import 'package:sale_product_app/repository/authentication_repository.dart';
import 'package:sale_product_app/service/api_remote_service_impl.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  var apiRemoteService = ApiRemoteServiceImpl();
  @override
  Future<LoginResponse> login({
    required String username,
    required String password,
  }) async {
    var loginRequest = LoginRequest(phoneNumber: username, password: password);
    var loginResponse = LoginResponse();
    var response = await apiRemoteService.postApi(
      url: ConstantUri.loginPath,
      body: jsonEncode(loginRequest.toJson()),
    );
    if (response.isSuccess == true) {
      loginResponse = LoginResponse.fromJson(jsonDecode(response.data));
      // print("Response login data ${(loginResponse.toJson())} ");
    }
    return loginResponse;
  }

  @override
  Future<ApiBaseResponse> register(RegisterRequest req) async {
    return await apiRemoteService.postApi(
      url: ConstantUri.registerPath,
      body: jsonEncode(req.toJson()),
    );
  }
}
