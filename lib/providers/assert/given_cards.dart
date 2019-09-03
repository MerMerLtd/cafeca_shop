import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import './given_card.dart';

class GivenCards with ChangeNotifier {
  // Map<String, GivenCard> _items = {
  //   'p1': GivenCard(
  //     cardId: 'i1',
  //     price: 180.0,
  //     // quantity: 11, //
  //     title: 'item1',
  //     from: 'bd5e5eb049f3907175f54f5a571ba6b9fdea36ab',
  //     // time: DateTime.now().toString(),
  //     // colorVal: '0xffeb4034',
  //   ),
  //   'p2': GivenCard(
  //     cardId: 'i2',
  //     price: 120.0,
  //     // quantity: 11,
  //     title: 'item2',
  //     // colorVal: '0xff2b3ae3',
  //   ),
  //   'p3': GivenCard(
  //     cardId: 'i3',
  //     price: 210.0,
  //     // quantity: 6,
  //     title: 'item3',
  //     // colorVal: '0xffe6d81c',
  //   ),
  //   'p4': GivenCard(
  //     cardId: 'i4',
  //     price: 160.0,
  //     // quantity: 16,
  //     title: 'item4',
  //     // colorVal: '0xff8d24ad',
  //   ),
  //   'p5': GivenCard(
  //     cardId: 'i5',
  //     price: 280.0,
  //     // quantity: 2,
  //     title: 'item5',
  //     // colorVal: '0xff248dad',
  //   ),
  // };

  List<GivenCard> _items;

  Future<void> fetchGivenCards() async {
    // const url = 'https://api.cafeca.cc/api/v1/user/given';
    const url = '../json/assert/list_given_card.json';
    try {
      final response = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Token': 'bd5e5eb049f3907175f54f5a571ba6b9fdea36ab',
      });
      print(response);
      
    } catch (error) {
      throw error;
    }
  }

  List<GivenCard> get items {
    return [..._items];
  }

  List listItems(id) {
    List<GivenCard> items = _items.where((item) => item.cardId == id).toList();
    return items;
  }

  int itemCounts(id) {
    return listItems(id).length;
  }

  double itemAmounts(id) {
    List<GivenCard> items = listItems(id);
    return items.length * items[0].price;
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((givenCard) {
      total += givenCard.price;
    });
    return total;
  }

  

  // Future<void> takeCard(GivenCard givenCard,List details) async {
  //   final url = 'https://api.cafeca.cc/api/v1/user/card/:${givenCard.cardId}/take';
  //   final newGivenCard = GivenCard(
  //     cardId: givenCard.cardId, //？？ 之後會改
  //     // ?? where to get the User Info ?
  //     time: DateTime.now().toString(),
  //     title: givenCard.title,
  //     price: givenCard.price,
  //     details: details,
  //   );
  // }

  // void addItem(
  //   String productId,
  //   double price,
  //   String title,
  //   int quantity,
  //   String colorVal,
  // ) {
  //   if (_items.containsKey(productId)) {
  //     //change quantity
  //     _items.update(
  //         productId,
  //         (existingSoldItem) => SoldItem(
  //               id: existingSoldItem.id,
  //               title: existingSoldItem.title,
  //               price: existingSoldItem.price,
  //               colorVal: colorVal,
  //               quantity: existingSoldItem.quantity + quantity,
  //             )); //  the new CartIteam is created based on the existing one and replace the old one.
  //   } else {
  //     _items.putIfAbsent(
  //       productId,
  //       () => SoldItem(
  //             id: DateTime.now().toString(),
  //             title: title,
  //             price: price,
  //             colorVal: colorVal,
  //             quantity: quantity,
  //           ),
  //     );
  //   }
  //   notifyListeners();
  // }
}
