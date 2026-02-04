import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sale_product_app/data/local/user_data_local.dart';
import 'package:sale_product_app/repository/authentication_repository_impl.dart';

class LoginViewModel extends GetxController {
  var usernameController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;
  var inputValueUsername = "".obs;
  var authenticationRepository = AuthenticationRepositoryImpl();
  var onloadingLogin = false.obs;
  var storage = GetStorage().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  onChangeInputUsername(String value) {
    inputValueUsername.value = value;
  }

  onLogin() async {
    var username = usernameController.value.text;
    var password = passwordController.value.text;
    if (username.isEmpty) {
      showMessageError("Username is required ❌");
      return;
    }
    if (password.isEmpty) {
      showMessageError("Password is required ❌");
      return;
    }
    onloadingLogin.value = true;
    var login = await authenticationRepository.login(
      username: username,
      password: password,
    );
    if (login.accessToken != null) {
      showMessageSuccess("Login successfully ✅");
      // storage.value.write("USER_NAME", login.user?.username);
      // storage.value.write("PHONE", login.user?.phoneNumber);
      // storage.value.write("EMAIL", login.user?.email);
      // storage.value.write("ACCESS_TOKEN", login.accessToken);
      // storage.value.write("REFRESH_TOKEN", login.refreshToken);
      UserDataLocal.saveRefreshToken(login.refreshToken!);
      UserDataLocal.saveAccessToken(login.accessToken!);
      UserDataLocal.saveUserData(login.user!);
      Get.offAllNamed("/splash");
    } else {
      showMessageError("Your username or password is incorrect!");
    }
    onloadingLogin.value = false;
  }

  showMessageError(String message) {
    Get.snackbar(
      "ERROR",
      message,
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
  }

  showMessageSuccess(String message) {
    Get.snackbar(
      "SUCCESS",
      message,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }
}
