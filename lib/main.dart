import 'package:flutter/material.dart';
import 'package:sale_product_app/app/my_app.dart';
import 'package:get_storage/get_storage.dart';

void main() async{
  await GetStorage.init();
  runApp(const MyApp());
}

