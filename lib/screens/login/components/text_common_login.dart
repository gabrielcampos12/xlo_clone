import 'package:flutter/material.dart';
class TextCommonLogin extends StatelessWidget {
  TextCommonLogin({this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color:Colors.grey[800],
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
