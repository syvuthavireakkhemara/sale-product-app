import 'package:get_storage/get_storage.dart';
import 'package:sale_product_app/models/response/User.dart';

class UserDataLocal {
  static String username = "USERNAME";
  static String email = "EMAIL";
  static String phone = "PHONE";
  static String refreshToken = "REFRESH_TOKEN";
  static String accessToken = "ACCESS_TOKEN";

  //Save UserData (Write)
  static saveUserData(User user) {
    var storage = GetStorage();
    storage.write(username, user.username);
    storage.write(phone, user.phoneNumber);
    storage.write(email, user.email);
  }

  //Get UserData (Read)
  static User getUserData() {
    var storage = GetStorage();
    return User(
      username: storage.read(username),
      email: storage.read(email),
      phoneNumber: storage.read(email),
    );
  }

  //Save Access Token
  static saveAccessToken(String token) {
    var storage = GetStorage();
    storage.write(accessToken, token);
  }

  //Remove UserData (Logout)
  static removeUserData() {
    var storage = GetStorage();
    storage.remove(username);
    storage.remove(phone);
    storage.remove(email);
    storage.remove(accessToken);
    storage.remove(refreshToken);
  }

  //Save Refresh Token
  static saveRefreshToken(String refresh) {
    var storage = GetStorage();
    storage.write(refreshToken, refresh);
  }

  //Get Access Token
  static getAccessToken() {
    var storage = GetStorage();
    return storage.read(accessToken);
  }

  //Get Refresh Token
  static getRefreshToken() {
    var storage = GetStorage();
    return storage.read(refreshToken);
  }
}
