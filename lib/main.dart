import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/overview_screen.dart';
import './providers/sold_items.dart';
import './providers/auth.dart';

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
        ChangeNotifierProvider.value(
          value: Auth(),
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
