import 'package:flutter/material.dart';

class Tag extends StatefulWidget {
  final Color color;
  final String label;

  const Tag({
    Key key,
    this.color,
    this.label,
  }) : super(key: key);

  @override
  _TagState createState() => _TagState();
}

class _TagState extends State<Tag> {
  bool onSelected = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: GestureDetector(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(color: widget.color),
            color: onSelected ? widget.color : Colors.transparent,
          ),
          child: Stack(
            children: <Widget>[
              Center(
                child: Text(
                  widget.label,
                  style: TextStyle(
                      color: onSelected ? Colors.white : widget.color,
                      fontSize: 20),
                ),
              ),
              if (onSelected)
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                  ),
                ),
            ],
          ),
        ),
        onTap: () {
          setState(() {
            onSelected = !onSelected;
          });
        },
      ),
    );
  }
}