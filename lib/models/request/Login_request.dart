import 'dart:convert';
/// phoneNumber : "09625050168"
/// password : "123456"

LoginRequest loginRequestFromJson(String str) => LoginRequest.fromJson(json.decode(str));
String loginRequestToJson(LoginRequest data) => json.encode(data.toJson());
class LoginRequest {
  LoginRequest({
      String? phoneNumber, 
      String? password,}){
    _phoneNumber = phoneNumber;
    _password = password;
}

  LoginRequest.fromJson(dynamic json) {
    _phoneNumber = json['phoneNumber'];
    _password = json['password'];
  }
  String? _phoneNumber;
  String? _password;
LoginRequest copyWith({  String? phoneNumber,
  String? password,
}) => LoginRequest(  phoneNumber: phoneNumber ?? _phoneNumber,
  password: password ?? _password,
);
  String? get phoneNumber => _phoneNumber;
  String? get password => _password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['phoneNumber'] = _phoneNumber;
    map['password'] = _password;
    return map;
  }

}