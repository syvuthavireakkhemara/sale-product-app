import 'package:get/get.dart';
import 'package:sale_product_app/features/admin/manage/category/model/Category_model.dart';
import 'package:sale_product_app/repository/admin_category_impl.dart';

class CategoryViewModel extends GetxController {
  var categoryRepository = AdminCategoryRepositoryImpl();
  var categoryList = <CategoryModel>[].obs;
  var loading = false.obs;

  @override
  void onInit() {
    getAllCategories();
    super.onInit();
  }

  getAllCategories() async {
    loading.value = true;
    categoryList.value = [];
    var response = await categoryRepository.getAllCategories();
    if (response.data != null) {
      response.data.forEach((data) {
        var res = CategoryModel.fromJson(data);
        categoryList.add(res);
      });
    }
    loading.value = false;
  }

  getCategoryById(id) async {
    var response = await categoryRepository.getCategoryById(id);
    if (response.data != null) {
      var category = CategoryModel.fromJson(response.data);
      Get.toNamed(
        "/admin/manage/category/form",
        parameters: {"id": "${category.id}", "name": category.name!},
      );
    }
  }

  deleteCategory(CategoryModel req) async {
    var response = await categoryRepository.deleteCategory(req);
    if (response.data != null) {
      // Logic for successful deletion:
      // 1. Show a success message (optional)
      // 2. Refresh the list to update the UI
      await getAllCategories();
    } else {
      // Logic for failed deletion:
      // 1. Show an error message (optional)
    }
  }


}
