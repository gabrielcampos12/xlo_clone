import'package:flutter/material.dart';
class FieldTitle extends StatelessWidget {
  FieldTitle({this.title,this.subtitle});

  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 3,bottom: 4),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.end,
        spacing: 5,
        children: [
          Text(
            '$title',
            style: TextStyle(
              color: Colors.grey[800],
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '$subtitle',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
        ],
      ) ,
    );
  }
}
