import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Summary with ChangeNotifier {
  Future<void> fetchSummary(String urlSegment) async { // urlSegment: daily || monthly
    // final url = 'https://api.cafeca.cc/api/v1/business/$urlSegment';
    final url = '../json/business/$urlSegment';
    try {
      final response = http.get(url,
          headers: {"Token": "bd5e5eb049f3907175f54f5a571ba6b9fdea36ab"});
          print(response);
    } catch (error) {
      throw error;
    }
  }
}
