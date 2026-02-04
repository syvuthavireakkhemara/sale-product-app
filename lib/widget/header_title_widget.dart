import 'package:flutter/material.dart';

class HeaderTitleWidget extends StatelessWidget {
  String? title;
  double? fontSize;
  HeaderTitleWidget({super.key, this.title, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Text(
      "$title",
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize ?? 24,color: Colors.black),
    );
  }
}
