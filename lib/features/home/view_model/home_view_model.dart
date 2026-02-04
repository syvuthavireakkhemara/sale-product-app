import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../models/response/User.dart';

class HomeViewModel extends GetxController{
  var user = User().obs;
  var storage = GetStorage().obs;

  @override
  void onInit()
  {
    getUserProfile();
    super.onInit();
  }

  getUserProfile() {
    user.value.username = storage.value.read("USER_NAME") ?? "";
    user.value.phoneNumber = storage.value.read("PHONE") ?? "";
    user.value.email = storage.value.read("EMAIL") ?? "";
  }
}