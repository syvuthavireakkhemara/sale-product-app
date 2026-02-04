import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sale_product_app/features/admin/manage/category/view/category_form_view.dart';
import 'package:sale_product_app/features/admin/manage/category/view/category_view.dart';
import 'package:sale_product_app/features/admin/manage/product/view/product_view.dart';
import 'package:sale_product_app/features/authentication/view/login_view.dart';
import 'package:sale_product_app/features/authentication/view/register_view.dart';
import 'package:sale_product_app/features/home/view/home_view.dart';
import 'package:sale_product_app/features/splash/view/splash_view.dart';
import 'package:sale_product_app/utils/message.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: "/splash",
      translations: Messages(),
      locale: Locale("km", "KH"),
      fallbackLocale: Locale("km", "KH"),
      getPages: [
        GetPage(
          name: "/splash",
          page: () => SplashView(),
          transition: Transition.fadeIn,
        ),
        GetPage(name: "/home", page: () => HomeView()),
        GetPage(name: "/login", page: () => LoginView()),
        GetPage(name: "/register", page: () => RegisterView()),
        GetPage(name: "/admin/manage/category", page: () => CategoryView()),
        GetPage(name: "/admin/manage/category/form", page: () => CategoryFormView()),
        GetPage(name: "/admin/manage/product", page: () => ProductView()),
      ],
    );
  }
}
