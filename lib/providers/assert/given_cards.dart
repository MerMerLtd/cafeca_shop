import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import './given_card.dart';

class GivenCards with ChangeNotifier {
  List<GivenCard> _items;
  List<GivenCard> _onKindItems;

  Future<void> fetchGivenCards() async {
    // const url = 'https://api.cafeca.cc/api/v1/user/given';
    const url = '../json/assert/list_given_card.json';
    try {
      final response = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Token': 'bd5e5eb049f3907175f54f5a571ba6b9fdea36ab',
      });
      final extractedData = json.decode(response.body) as List<GivenCard>;
      if (extractedData == null) {
        return;
      }
      // print(extractedData);
      // final List<GivenCard> loadedGivenCards = [];
      // extractedData.forEach((card) {
      //   loadedGivenCards.add(GivenCard(
      //     cardId: card.cardId,
      //     from: card.from,
      //     time: card.time,
      //     title: card.title,
      //     imageUrl: card.imageUrl,
      //     price: card.price,
      //     details: card.details,
      //   ));
      // });
      _items = extractedData; // _items = loadedGivenCards;
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> fetchOneKindGivenCards(String id) async {
    // const url = 'https://api.cafeca.cc/api/v1/user/given/:cardId';
    const url = '../json/assert/list_given_card.json';
    try {
      final response = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Token': 'bd5e5eb049f3907175f54f5a571ba6b9fdea36ab',
      });
      final extractedData = json.decode(response.body) as List<GivenCard>;
      if (extractedData == null) {
        return;
      }
      
      _onKindItems = extractedData; // _items = loadedGivenCards;
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  List<GivenCard> get items {
    return [..._items];
  }

}

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
