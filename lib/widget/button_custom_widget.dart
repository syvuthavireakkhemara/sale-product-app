import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonCustomWidget extends StatelessWidget {
  VoidCallback? onPressed;
  bool? onLoading;
  String? title;
  ButtonCustomWidget({super.key, required this.onPressed, this.onLoading, this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        onPressed: onPressed,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 18),
          width: double.infinity,
          child: onLoading == true
              ? Center(child: CircularProgressIndicator(color: Colors.white))
              : Text(
                  "$title".tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
        ),
      ),
    );
  }
}
