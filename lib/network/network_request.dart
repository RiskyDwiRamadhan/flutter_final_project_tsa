import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_final_project_tsa/model/kata.dart';
import 'package:http/http.dart' as http;

class NetworkRequest {
  static const String url =
      'https://my-json-server.typicode.com/RiskyDwiRamadhan/tsa_api/hewan';

  static List<Kata> parseKata(String responseBody) {
    var list = json.decode(responseBody) as List<dynamic>;
    List<Kata> katas = list.map((model) => Kata.fromJson(model)).toList();
    return katas;
  }

  static Future<List<Kata>> fetchKatas() async {
    final response = await http.get(Uri.parse('$url'));
    if (response.statusCode == 200) {
      return compute(parseKata, response.body);
    } else {
      throw Exception('Can\'t get data');
    }
  }
}
