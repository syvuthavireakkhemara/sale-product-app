import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sale_product_app/features/splash/view_model/splash_view_model.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    var splashViewModel = Get.put(SplashViewModel());
    return Scaffold(
      body: Obx((){
        return Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${splashViewModel.splashModel.value.title}",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 36
                ),
              ),
              Text(
                "${splashViewModel.splashModel.value.subTitle}",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                ),
              ),
              SizedBox(height: 35,),
              CircularProgressIndicator(
                color: Colors.black,
              )
            ],
          ),
        );
      })
    );
  }
}
