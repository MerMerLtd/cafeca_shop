import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/overview_screen.dart';
import './prodivers/sold_items.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: SoldItems(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.pinkAccent,
          fontFamily: 'Lato',
        ),
        title: 'Cafeca Shop',
        home: OverviewScreen(),
      ),
    );
  }
}

// https://encycolorpedia.com/db7093
