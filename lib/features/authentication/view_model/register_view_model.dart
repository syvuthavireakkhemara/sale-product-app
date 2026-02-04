import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sale_product_app/models/request/Register_request.dart';
import 'package:sale_product_app/repository/authentication_repository_impl.dart';

import '../../../utils/message_utils.dart';

class RegisterViewModel extends GetxController {
  var firstNameController = TextEditingController().obs;
  var lastNameController = TextEditingController().obs;
  var usernameController = TextEditingController().obs;
  var emailController = TextEditingController().obs;
  var phoneController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;
  var confirmPasswordController = TextEditingController().obs;
  var loadingRegister = false.obs;
  var authRepository = AuthenticationRepositoryImpl();

  @override
  void onInit() {
    super.onInit();
  }

  onRegister() async {
    var firstName = firstNameController.value.text;
    var lastName = lastNameController.value.text;
    var username = usernameController.value.text;
    var phone = phoneController.value.text;
    var email = emailController.value.text;
    var password = passwordController.value.text;
    var confirmPassword = confirmPasswordController.value.text;

    if (username.isEmpty) {
      MessageUtil.showMessageError("Enter username");
      return;
    }
    if (phone.isEmpty) {
      MessageUtil.showMessageError("Enter phone");
      return;
    }
    if (email.isEmpty) {
      MessageUtil.showMessageError("Enter email");
      return;
    }
    if (password.isEmpty) {
      MessageUtil.showMessageError("Enter password");
      return;
    }
    if (confirmPassword.isEmpty) {
      MessageUtil.showMessageError("Confirm password");
      return;
    }
    if (password != confirmPassword) {
      MessageUtil.showMessageError("confirm password not match!");
      return;
    }
    loadingRegister.value = true;
    var req = RegisterRequest(
      firstName: firstName,
      lastName: lastName,
      username: username,
      email: email,
      phoneNumber: phone,
      password: password,
      confirmPassword: confirmPassword,
      profile: "",
      role: "USER",
    );
    var registerResponse = await authRepository.register(req);
    if (registerResponse.isSuccess == true) {
      MessageUtil.showMessageSuccess("Register Account Successfully.");
    } else {
      MessageUtil.showMessageError("Can't register account");
    }
  }
}
