import 'package:sale_product_app/models/response/ApiBaseResponse.dart';

abstract class ApiRemoteService {
  Future<ApiBaseResponse> postApi ({required String url, required dynamic body});
  Future<ApiBaseResponse> getApi ({required String url});
  Future<ApiBaseResponse> postApiToken({required String url, required dynamic requestBody});
}