import 'package:flutter/material.dart';

class BorderAllText extends StatelessWidget {
  final String text;
  final double borderRadius;
  final Color borderColor;

  const BorderAllText({
    Key key,
    @required this.text,
    this.borderRadius,
    this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: Theme.of(context).tabBarTheme.labelPadding,
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor != null
              ? borderColor
              : Theme.of(context).primaryColor,
        ),
        borderRadius:
            borderRadius != null ? borderRadius : BorderRadius.circular(50),
      ),
      child: Text(text),
    );
  }
}
