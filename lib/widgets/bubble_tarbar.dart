import 'package:flutter/material.dart';

class BubbleTabBar extends StatelessWidget {
  final List<Widget> tabs;
  final Color backgroundColor;
  final Color unselectedLabelColor;
  final Color labelColor;
  final double fontSize;

  const BubbleTabBar({
    Key key,
    @required this.tabs,
    this.backgroundColor,
    this.labelColor,
    this.fontSize,
    this.unselectedLabelColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          color: backgroundColor != null
              ? backgroundColor
              : Theme.of(context).primaryColor,
        ),
        color: backgroundColor != null
            ? backgroundColor
            : Theme.of(context).primaryColor,
      ),
      labelColor: labelColor != null
          ? labelColor
          : Theme.of(context).tabBarTheme.labelColor,
      labelStyle: TextStyle(
        fontSize: fontSize != null ? fontSize : 24,
      ),
      unselectedLabelColor: unselectedLabelColor != null
          ? unselectedLabelColor
          : Theme.of(context).primaryColor,
      tabs: tabs,
    );
  }
}
