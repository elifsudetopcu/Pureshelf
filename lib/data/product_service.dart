import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../models/product.dart';

// Urunleri assets/data/products.json dosyasindan okur.
class ProductService {
  static Future<List<Product>> loadProducts() async {
    final text = await rootBundle.loadString('assets/data/products.json');
    final List<dynamic> list = jsonDecode(text);
    return list
        .map((item) => Product.fromJson(item as Map<String, dynamic>))
        .toList();
  }
}
