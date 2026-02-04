import 'package:sale_product_app/features/admin/manage/category/model/Category_model.dart';
import 'package:sale_product_app/models/response/App_base_response.dart';

abstract class AdminCategoryRepository {
  Future<AppBaseResponse> getAllCategories();
  Future<AppBaseResponse> createCategory(CategoryModel req);
  Future<AppBaseResponse> getCategoryById (int id);
  Future<AppBaseResponse> updateCategory(CategoryModel req);
  Future<AppBaseResponse> deleteCategory(CategoryModel req);
}
