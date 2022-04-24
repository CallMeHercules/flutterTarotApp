import 'dart:convert';
import 'dart:core' show Exception, Future, List, Uri, print;
import 'package:http/http.dart' as http;
//local
import 'cards.dart';

class CardsBuilder{
  CardsBuilder._privateConstructor();
  static final CardsBuilder instance = CardsBuilder._privateConstructor();

  Future<List<Cards>> readJson() async {
    final response =
    await http.get(Uri.parse('https://rws-cards-api.herokuapp.com/api/v1/cards/random?n=50'));

    if (response.statusCode == 200) {
    } else {
      throw Exception('Failed to load post');
    }
    var apiCall = json.decode(response.body);
    var cards = apiCall['cards'] as List;
    List<Cards> cardsList = cards.isNotEmpty
        ? cards.map((c) => Cards.fromMap(c)).toList()
        : [];
    return cardsList;
  }



}