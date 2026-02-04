class ApiBaseRequest {
  ApiBaseRequest({
    this.limit = 1000,
    this.page = 1,
    this.userId = 0,
    this.status = "ACT",
    this.id = 0,
    this.categoryId = 0,
    this.name = "",
    this.type = "",
    this.categoryHotelId = 0,
  });

  ApiBaseRequest.fromJson(dynamic json) {
    limit = json['limit'];
    page = json['page'];
    userId = json['userId'];
    status = json['status'];
    id = json['id'];
    categoryId = json['categoryId'];
    name = json['name'];
    type = json['type'];
    categoryHotelId = json['categoryHotelId'];
  }
  int? limit;
  int? page;
  int? userId;
  String? status;
  int? id;
  int? categoryId;
  String? name;
  String? type;
  int? categoryHotelId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['limit'] = limit;
    map['page'] = page;
    map['userId'] = userId;
    map['status'] = status;
    map['id'] = id;
    map['categoryId'] = categoryId;
    map['name'] = name;
    map['type'] = type;
    map['categoryHotelId'] = categoryHotelId;
    return map;
  }
}
