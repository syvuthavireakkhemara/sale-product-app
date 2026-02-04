import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sale_product_app/features/authentication/view_model/login_view_model.dart';
import 'package:sale_product_app/widget/button_custom_widget.dart';
import 'package:sale_product_app/widget/header_title_widget.dart';
import 'package:sale_product_app/widget/input_custom_widget.dart';
import 'package:sale_product_app/widget/subtitle_widget.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    var loginViewModel = Get.put(LoginViewModel());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue,
        title: Text("Login", style: TextStyle(color: Colors.white)),
      ),
      body: Obx(() {
        return SingleChildScrollView(
          child: Container(
            // padding: EdgeInsets.only(left: 16, right: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 35),
                SizedBox(
                  width: double.infinity,
                  child: Center(child: HeaderTitleWidget(title: "Login")),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Center(
                    child: SubtitleWidget(title: "To Sale Product App"),
                  ),
                ),
                SizedBox(height: 45),
                InputCustomWidget(
                  labelText: "username",
                  hintText: "Enter your username",
                  prefixIcon: Icon(Icons.email),
                  controller: loginViewModel.usernameController.value,
                  onChanged: (value) {
                    loginViewModel.onChangeInputUsername(value);
                  },
                ),
                // TextField(
                //   onChanged: (value) {
                //     loginViewModel.onChangeInputUsername(value);
                //   },
                //   controller: loginViewModel.usernameController.value,
                //   keyboardType: TextInputType.text,
                //   decoration: InputDecoration(
                //     border: OutlineInputBorder(),
                //     prefixIcon: Icon(Icons.email),
                //     labelText: "Username".tr,
                //     hintText: "Enter your username",
                //     labelStyle: TextStyle(color: Colors.black54),
                //     enabledBorder: OutlineInputBorder(
                //       borderSide: BorderSide(width: 3, color: Colors.black54),
                //       borderRadius: BorderRadius.all(Radius.circular(10)),
                //     ),
                //     focusedBorder: OutlineInputBorder(
                //       borderSide: BorderSide(width: 3, color: Colors.black54),
                //       borderRadius: BorderRadius.all(Radius.circular(10)),
                //     ),
                //   ),
                // ),
                SizedBox(height: 15),
                InputCustomWidget(
                  labelText: "password",
                  hintText: "Enter your password",
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: Icon(Icons.remove_red_eye),
                  controller: loginViewModel.passwordController.value,
                  onChanged: (value) {
                    loginViewModel.onChangeInputUsername(value);
                  },
                ),
                // TextField(
                //   controller: loginViewModel.passwordController.value,
                //   decoration: InputDecoration(
                //     border: OutlineInputBorder(),
                //     prefixIcon: Icon(Icons.lock),
                //     suffixIcon: Icon(Icons.remove_red_eye),
                //     labelText: "Password",
                //     hintText: "Enter your password",
                //     labelStyle: TextStyle(color: Colors.black54),
                //     enabledBorder: OutlineInputBorder(
                //       borderSide: BorderSide(width: 3, color: Colors.black54),
                //       borderRadius: BorderRadius.all(Radius.circular(10)),
                //     ),
                //     focusedBorder: OutlineInputBorder(
                //       borderSide: BorderSide(width: 3, color: Colors.black54),
                //       borderRadius: BorderRadius.all(Radius.circular(10)),
                //     ),
                //   ),
                // ),
                SizedBox(height: 35),
                // ElevatedButton(
                //   style: ElevatedButton.styleFrom(
                //     backgroundColor: Colors.blue,
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.all(Radius.circular(10)),
                //     ),
                //   ),
                //   onPressed: () {
                //     if (loginViewModel.onloadingLogin.value == false) {
                //       loginViewModel.onLogin();
                //     }
                //   },
                //   child: Container(
                //     padding: EdgeInsets.symmetric(vertical: 18),
                //     width: double.infinity,
                //     child: loginViewModel.onloadingLogin.value == true
                //         ? Center(
                //             child: CircularProgressIndicator(
                //               color: Colors.white,
                //             ),
                //           )
                //         : Text(
                //             "Login",
                //             textAlign: TextAlign.center,
                //             style: TextStyle(
                //               color: Colors.white,
                //               fontWeight: FontWeight.bold,
                //               fontSize: 16,
                //             ),
                //           ),
                //   ),
                // ),
                ButtonCustomWidget(
                  title: "login",
                  onLoading: loginViewModel.onloadingLogin.value,
                  onPressed: () {
                    if (loginViewModel.onloadingLogin.value == false) {
                      loginViewModel.onLogin();
                    }
                  },
                ),
                SizedBox(height: 15),
                ButtonCustomWidget(
                  onPressed: () {
                    Get.toNamed("/register");
                  },
                  title: "Register",
                ),
                // ElevatedButton(
                //   style: ElevatedButton.styleFrom(
                //     backgroundColor: Colors.indigo,
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.all(Radius.circular(10)),
                //     ),
                //   ),
                //   onPressed: () {
                //     Get.toNamed("/register");
                //   },
                //   child: Container(
                //     padding: EdgeInsets.symmetric(vertical: 18),
                //     width: double.infinity,
                //     child: Text(
                //       "Register",
                //       textAlign: TextAlign.center,
                //       style: TextStyle(
                //         color: Colors.white,
                //         fontWeight: FontWeight.bold,
                //         fontSize: 16,
                //       ),
                //     ),
                //   ),
                // ),
                // SubtitleWidget(title: loginViewModel.inputValueUsername.value),
              ],
            ),
          ),
        );
      }),
    );
  }
}
