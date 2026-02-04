import 'package:sale_product_app/models/request/Register_request.dart';
import 'package:sale_product_app/models/response/ApiBaseResponse.dart';
import 'package:sale_product_app/models/response/Login_response.dart';

abstract class AuthenticationRepository {
  Future<LoginResponse> login({
    required String username,
    required String password,
  });
  Future<ApiBaseResponse> register(RegisterRequest req);
}
