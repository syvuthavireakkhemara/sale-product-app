import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InputCustomWidget extends StatelessWidget {
  ValueChanged<String>? onChanged;
  TextEditingController? controller;
  Icon? prefixIcon, suffixIcon;
  String? labelText, hintText;
  InputCustomWidget({
    super.key,
    this.onChanged,
    this.controller,
    this.hintText,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
      child: TextField(
        onChanged: onChanged,
        controller: controller,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          prefixIcon: prefixIcon,
          labelText: "$labelText".tr,
          hintText: "$hintText".tr,
          labelStyle: TextStyle(color: Colors.black54),
          suffixIcon: suffixIcon,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 3, color: Colors.black54),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 3, color: Colors.black54),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
      ),
    );
  }
}
