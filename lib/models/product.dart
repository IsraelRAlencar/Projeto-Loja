import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Product with ChangeNotifier {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.isFavorite = false,
  });

  Future<void> toggleFavorite() async {
    const baseUrl = 'https://shop-israel-default-rtdb.firebaseio.com';

    isFavorite = !isFavorite;
    notifyListeners();

    await http
        .patch(
          Uri.parse('$baseUrl/products/$id.json'),
          body: jsonEncode(
            {
              "isFavorite": isFavorite,
            },
          ),
        )
        .then((response) => print(response.body));
  }
}
