import 'dart:convert';
import 'package:cafeca_shop/providers/assert/given_card.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Item {
  final title;
  final amount;
  final quantity;
  final priceAvg;
  final percentage;

  Item({
    this.title,
    this.amount,
    this.quantity,
    this.priceAvg,
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

  Map<String, Summary> _summary;

  Future<void> fetchSummary(String urlSegment) async {
    // urlSegment: daily || monthly
    // final url = 'https://api.cafeca.cc/api/v1/business/$urlSegment';
    final url = '../json/business/$urlSegment';
    try {
      final response = await http.get(url, headers: {
        "Token": "bd5e5eb049f3907175f54f5a571ba6b9fdea36ab",
      });
      final extractedData = json.decode(response.body);
      if (extractedData == null) {
        return;
      }
      _summary = {urlSegment: extractedData};
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Map<String, Summary> get summarize {
    return _summary;
  }
}
