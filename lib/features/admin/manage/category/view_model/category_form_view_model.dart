import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sale_product_app/features/admin/manage/category/model/Category_model.dart';
import 'package:sale_product_app/models/response/App_base_response.dart';
import 'package:sale_product_app/repository/admin_category_impl.dart';
import 'package:sale_product_app/utils/message_utils.dart';

class CategoryFormViewModel extends GetxController {
  var categoryController = TextEditingController().obs;
  var categoryModel = CategoryModel().obs;
  var loading = false.obs;
  var categoryRepo = AdminCategoryRepositoryImpl();

  @override
  void onInit() {
    // TODO: implement onInit
    int id = int.parse(Get.parameters["id"] ?? "0");
    if (id != 0) {
      categoryModel.value.id = id;
      categoryModel.value.name = Get.parameters["name"];
      categoryController.value.text = categoryModel.value.name ?? "";
    }
    super.onInit();
  }

  onCreateCategory() async {
    var categoryName = categoryController.value.text;
    if (categoryName.isEmpty) {
      MessageUtil.showMessageError("Please enter category name");
      return;
    }
    loading.value = true;
    categoryModel.value.name = categoryName;
    var response = AppBaseResponse();
    if (categoryModel.value.id != 0) {
      response = await categoryRepo.updateCategory(categoryModel.value);
    } else {
      response = await categoryRepo.createCategory(categoryModel.value);
    }
    response = await categoryRepo.createCategory(categoryModel.value);
    if (response.code == "SUC-000") {
      Get.back();
      MessageUtil.showMessageSuccess(response.message ?? "");
    } else {
      MessageUtil.showMessageSuccess(response.message ?? "");
    }
    loading.value = false;
  }
}
