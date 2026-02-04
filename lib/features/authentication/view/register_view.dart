import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sale_product_app/features/authentication/view_model/register_view_model.dart';
import 'package:sale_product_app/widget/button_custom_widget.dart';
import 'package:sale_product_app/widget/header_title_widget.dart';
import 'package:sale_product_app/widget/input_custom_widget.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    var registerViewModel = Get.put(RegisterViewModel());
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text("Register", style: TextStyle(color: Colors.white)),
      ),
      body: Obx((){
        return SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: Center(
                  child: HeaderTitleWidget(title: "Register New Account"),
                ),
              ),
              SizedBox(height: 10),
              InputCustomWidget(
                controller: registerViewModel.firstNameController.value,
                labelText: "First Name",
                hintText: "Enter your first name",
                prefixIcon: Icon(Icons.people),
              ),
              InputCustomWidget(
                controller: registerViewModel.lastNameController.value,
                labelText: "Last Name",
                hintText: "Enter your last name",
                prefixIcon: Icon(Icons.people),
              ),
              InputCustomWidget(
                controller: registerViewModel.usernameController.value,
                labelText: "Username",
                hintText: "Enter your username",
                prefixIcon: Icon(Icons.person),
              ),
              InputCustomWidget(
                controller: registerViewModel.phoneController.value,
                labelText: "Phone Number",
                hintText: "Enter your phone number",
                prefixIcon: Icon(Icons.phone_rounded),
              ),
              InputCustomWidget(
                controller: registerViewModel.emailController.value,
                labelText: "Email",
                hintText: "Enter your email",
                prefixIcon: Icon(Icons.email),
              ),
              InputCustomWidget(
                controller: registerViewModel.passwordController.value,
                labelText: "Password",
                hintText: "Enter your password",
                prefixIcon: Icon(Icons.password),
                suffixIcon: Icon(Icons.remove_red_eye),
              ),
              InputCustomWidget(
                controller: registerViewModel.confirmPasswordController.value,
                labelText: "Confirm Password",
                hintText: "Confirm your password",
                prefixIcon: Icon(Icons.password_outlined),
                suffixIcon: Icon(Icons.remove_red_eye),
              ),
              SizedBox(height: 35),
              ButtonCustomWidget(onPressed: () {
                registerViewModel.onRegister();
              }, title: "register"),
            ],
          ),
        );
      })
    );
  }
}
