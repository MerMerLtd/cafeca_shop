import 'package:flutter/foundation.dart';

class GivenCard extends ChangeNotifier {
  final String id;
  final String title;
  final int quantity;
  final double price;
  final String colorVal;

  GivenCard({
    this.id,
    this.title,
    this.quantity,
    this.price,
    // @required this.id,
    // @required this.title,
    // @required this.quantity,
    // @required this.price,
    this.colorVal,
  });
}
