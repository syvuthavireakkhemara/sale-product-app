import 'package:flutter/material.dart';

class SubtitleWidget extends StatelessWidget {
  String? title;
  double? fontSize;
  SubtitleWidget({super.key, this.title, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Text("$title", style: TextStyle(fontSize: fontSize ?? 24,color: Colors.black54));
  }
}
