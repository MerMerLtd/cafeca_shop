import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: <Widget>[
              Container(
                child: Image.asset(
                  "images/Logo_copy.png",
                  width: 200.0,
                  height: 200.0,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Color.fromRGBO(39, 44, 71, 1),
      ),
    );
  }
}

// https://encycolorpedia.com/db7093
