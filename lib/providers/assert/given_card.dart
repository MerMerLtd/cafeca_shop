import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class GivenCard extends ChangeNotifier {
  final String cardId;
  final String from; // userId ?? where to get the User Info ?
  final String time; // when the shop get this card
  final String title; //有特定的幾種品項， 特定種類獲得的數量由givenCards 取得
  final String imageUrl;
  final double price;
  final List details;
  // final int quantity; // 這之後需要拔掉
  // final String colorVal;

  GivenCard({
    this.cardId,
    this.from,
    this.time,
    this.title,
    this.imageUrl,
    this.price,
    this.details,
    // this.quantity,
    // this.colorVal,
  });

  Future<void> takeCard(double price, List details) async {
    // final url = 'https://api.cafeca.cc/api/v1/user/card/:$cardId/take';
    final url = '../json/assert/take_card.json';
    try {
      final response = await http.post(url,
          headers: {
            'Content-Type': 'application/json',
            'Token': 'bd5e5eb049f3907175f54f5a571ba6b9fdea36ab',
          },
          body: json.encode({
            'price': price,
            'detail': details,
          }));
      print(response);
      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }

  Future<void> returnCard(List details) async {
    // final url = 'https://api.cafeca.cc/api/v1/user/card/:$cardId/return';
    final url = '../json/assert/return_card.json';
    try {
      final response = await http.post(url, headers: {
        'Content-Type': 'application/json',
        'Token': 'bd5e5eb049f3907175f54f5a571ba6b9fdea36ab',
      }, body: {
        'detail': details // json.encode(details) ??
      });
      print(response);
      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }

  /// ====== After fix API uncomment this ================
  /// ====================================================
  // final String authToken;
  // final String userId;

  // GiftCards(
  //   this.authToken,
  //   this.userId,
  //   this._items,
  // );

//List all cards own by current user
//   Future<void> fetchAndSetGiftCards([bool filterByUser = false]) async {
//     final filterString =
//         filterByUser ? 'orderBy="creatorId"&equalTo="$userId"' : '';

//     var url =
//         'https://api.cafeca.cc/api/v1/user/card?auth=$authToken&$filterString';
//     try {
//       final response = await http.get(url);
//       final extractedData = json.decode(response.body) as Map<String, dynamic>;
//       if (extractedData == null) {
//         return;
//       }
//       url = '??/$userId?auth=$authToken';
//       final usedResponse = await http.get(url);
//       final usedData = json.decode(usedResponse.body);
//       final List<GiftCard> loadedGiftCards = [];
//       extractedData.forEach((cardId, cardData) {
//         loadedGiftCards.add(GiftCard(
//           id: cardId,
//           title: cardData['title'],
//           description: cardData['description'],
//           price: cardData['price'],
//           isUsed: usedData == null ? false : usedData[cardId] ?? false,
//           imageUrl: cardData['imageUrl'],
//           availableShopsId: cardData['availableShopsId'],
//         ));
//       });
//       _items = loadedGiftCards;
//       notifyListeners();
//     } catch (error) {
//       throw (error);
//     }
//   }

  //   Future<void> _removeCard(String id, String urlSegment) async {
//     final url =
//         'https://api.cafeca.cc/api/v1/user/card/:$id/$urlSegment?auth=$authToken';
//     final existingCardIndex = _items.indexWhere((card) => card.id == id);
//     var existingCard = _items[existingCardIndex];
//     _items.removeAt(existingCardIndex);
//     notifyListeners();
//     final response = await http.delete(url);
//     if (response.statusCode >= 400) {
//       _items.insert(existingCardIndex, existingCard);
//       notifyListeners();
//       throw HttpException('Could not $urlSegment Card.');
//     }
//     existingCard = null;
//   }

  // // ============ Return Card ============
// // Return a card if you do not want this
//   Future<void> returnCard(String id) async {
//     return _removeCard(id, 'return');
//   }

//   // ============ Take Card  ???? ============
// // Take a card and write a receipt
//   Future<void> addCard(GiftCard card) async {
//     final url = 'https://api.cafeca.cc/api/v1/user/card?auth=$authToken';
//     try {
//       final response = await http.post(
//         url,
//         body: json.encode({
//           'title': card.title,
//           'description': card.description,
//           'imageUrl': card.imageUrl,
//           'price': card.price,
//           // 'isUsed': card.isUsed,
//           'availableShopsId': card.availableShopsId,
//           'creatorId': userId,
//         }),
//       );
//       final newCard = GiftCard(
//         title: card.title,
//         description: card.description,
//         price: card.price,
//         imageUrl: card.imageUrl,
//         availableShopsId: card.availableShopsId,
//         id: json.decode(response.body)['name'],
//       );
//       _items.add(newCard);
//       notifyListeners();
//     } catch (error) {
//       print(error);
//       throw error;
//     }
//   }
  /// ====================================================
  /// ====================================================
}
