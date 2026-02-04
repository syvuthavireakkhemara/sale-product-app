import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sale_product_app/features/admin/manage/category/view_model/category_form_view_model.dart';
import 'package:sale_product_app/widget/button_custom_widget.dart';
import 'package:sale_product_app/widget/input_custom_widget.dart';

class CategoryFormView extends StatelessWidget {
  const CategoryFormView({super.key});

  @override
  Widget build(BuildContext context) {
    var viewModel = Get.put(CategoryFormViewModel());
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            viewModel.categoryModel.value.name == null
                ? "Create Category"
                : "Update Category",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          ),
          backgroundColor: Colors.blue,
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 35),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InputCustomWidget(
                controller: viewModel.categoryController.value,
                labelText: "Category Name",
                hintText: "Enter your category name.",
              ),
              SizedBox(height: 20),
              ButtonCustomWidget(
                title: viewModel.categoryModel.value.name == null
                    ? "Create"
                    : "Update",
                onLoading: viewModel.loading.value,
                onPressed: () {
                  viewModel.onCreateCategory();
                },
              ),
            ],
          ),
        ),
      );
    });
  }
}
