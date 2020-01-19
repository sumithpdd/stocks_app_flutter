 

import 'dart:convert';

import 'package:stocks_app_flutter/models/stock.dart';
import 'package:http/http.dart' as http;

class Webservice {
  Future<List<Stock>> getStocks() async {
    
    final url = "https://my-json-server.typicode.com/sumithpdd/demo/stocks";

    final response = await http.get(url);
    if (response.statusCode == 200) {
      Iterable json = jsonDecode(response.body);
      return json.map((stock) => Stock.fromJson(stock)).toList();
    } else {
      throw Exception("Error fetching stocks");
    }
  }
}