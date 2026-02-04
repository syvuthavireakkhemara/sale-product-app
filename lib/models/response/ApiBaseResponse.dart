class ApiBaseResponse {
  bool? isSuccess;
  String? message;
  String? errorCode;
  dynamic data;

  ApiBaseResponse({this.data, this.errorCode, this.isSuccess, this.message});
}
