import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Item {
  final title;
  final amount;
  final quantity;
  final percentage;

  Item({
    this.title,
    this.amount,
    this.quantity,
    this.percentage,
  });
}

class Summary with ChangeNotifier {
  final int totalQuantity;
  final double totalAmount;
  final List<Item> details;

  Summary({
    this.totalQuantity,
    this.totalAmount,
    this.details,
  });

  Summary _summary;

  Future<void> fetchSummary(int start, int end) async {
    // timeStamp 1970
    // urlSegment: daily || monthly
    final url =
        'https://api.cafeca.cc/api/v1/business?start=$start&end=$end'; //參考 js 呼叫 http 的參數寫法（不容易出錯）
    // final url = '../json/business/$urlSegment';
    try {
      final response = await http.get(url, headers: {
        "Token": "bd5e5eb049f3907175f54f5a571ba6b9fdea36ab",
      });
      final extractedData = json.decode(response.body)
          ? json.decode(response.body)
          : json.encode({
              "success": true,
              "data": {
                "totalQuantity": 46,
                "totalAmount": 7770,
                "details": [
                  {
                    "title": "Cappuccino",
                    "amount": 1980,
                    "quantity": 11,
                    "price": 180,
                    "priceAvg": 180,
                    "percentage": 0.25482
                  },
                  {
                    "title": "Espresso",
                    "amount": 1320,
                    "quantity": 11,
                    "price": 180,
                    "priceAvg": 120,
                    "percentage": 0.16988
                  },
                  {
                    "title": "Macchiato",
                    "amount": 1260,
                    "quantity": 6,
                    "price": 210,
                    "priceAvg": 210,
                    "percentage": 0.16216
                  },
                  {
                    "title": "Café Latte",
                    "amount": 2560,
                    "quantity": 16,
                    "price": 180,
                    "priceAvg": 160,
                    "percentage": 0.32947
                  },
                  {
                    "title": "Affogato",
                    "amount": 560,
                    "quantity": 2,
                    "price": 280,
                    "priceAvg": 280,
                    "discountPercentage": 1,
                    "discountAmount": 0,
                    "percentage": 0.07207
                  }
                ]
              }
            });
      if (extractedData == null) {
        return;
      }
      _summary = extractedData;
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Summary get summarize {
    return _summary;
  }
}
