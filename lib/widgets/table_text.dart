import 'package:flutter/material.dart';

class TableText extends StatelessWidget {
  final String title;
  final Color color;
  final double fontSize;
  TableText({
    this.title,
    this.color,
    this.fontSize,
  });
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: color,
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }
}
