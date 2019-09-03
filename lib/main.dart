import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/overview_screen.dart';
import './providers/assert/given_card.dart';
import './providers/assert/given_cards.dart';
import './providers/business/summary.dart';
import './providers/user/auth.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Auth(),
        ),
        ChangeNotifierProvider.value(
          value: GivenCard(),
        ),
        ChangeNotifierProvider.value(
          value: GivenCards(),
        ),
        ChangeNotifierProvider.value(
          value: Summary(),
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
