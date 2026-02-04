import 'dart:convert';

import 'package:sale_product_app/constants/constant_uri.dart';
import 'package:sale_product_app/features/admin/manage/category/model/Category_model.dart';
import 'package:sale_product_app/models/request/Api_base_request.dart';
import 'package:sale_product_app/models/response/App_base_response.dart';
import 'package:sale_product_app/repository/admin_category_repository.dart';
import 'package:sale_product_app/service/api_remote_service_impl.dart';

class AdminCategoryRepositoryImpl implements AdminCategoryRepository {
  var apiService = ApiRemoteServiceImpl();
  @override
  Future<AppBaseResponse> getAllCategories() async {
    AppBaseResponse appBaseResponse = AppBaseResponse();
    var response = await apiService.postApiToken(
      url: ConstantUri.adminCategoryListPath,
      requestBody: jsonEncode(ApiBaseRequest().toJson()),
    );
    if (response.isSuccess == true) {
      appBaseResponse = AppBaseResponse.fromJson(jsonDecode(response.data));
    }
    return appBaseResponse;
  }

  @override
  Future<AppBaseResponse> createCategory(CategoryModel req) async {
    AppBaseResponse appBaseResponse = AppBaseResponse();
    var response = await apiService.postApiToken(
      url: ConstantUri.adminCategoryCreatePath,
      requestBody: jsonEncode(req.toJson()),
    );
    if (response.isSuccess == true) {
      appBaseResponse = AppBaseResponse.fromJson(jsonDecode(response.data));
    }
    return appBaseResponse;
  }

  @override
  Future<AppBaseResponse> getCategoryById(int id) async {
    AppBaseResponse appBaseResponse = AppBaseResponse();
    var response = await apiService.postApiToken(
      url: "${ConstantUri.adminCategoryGetByIdPath}$id",
      requestBody: jsonEncode(ApiBaseRequest().toJson()),
    );
    if (response.isSuccess == true) {
      appBaseResponse = AppBaseResponse.fromJson(jsonDecode(response.data));
    }
    return appBaseResponse;
  }

  @override
  Future<AppBaseResponse> updateCategory(CategoryModel req) async {
    AppBaseResponse appBaseResponse = AppBaseResponse();
    var response = await apiService.postApiToken(
      url: ConstantUri.adminCategoryUpdatePath,
      requestBody: jsonEncode(req.toJson()),
    );
    if (response.isSuccess == true) {
      appBaseResponse = AppBaseResponse.fromJson(jsonDecode(response.data));
    }
    return appBaseResponse;
  }

  @override
  Future<AppBaseResponse> deleteCategory(CategoryModel req) async {
    AppBaseResponse appBaseResponse = AppBaseResponse();
    var response = await apiService.postApiToken(
      url: ConstantUri.adminCategoryDeletePath,
      requestBody: jsonEncode(req.toJson()),
    );
    if (response.isSuccess == true) {
      appBaseResponse = AppBaseResponse.fromJson(jsonDecode(response.data));
    }
    return appBaseResponse;
  }
}
