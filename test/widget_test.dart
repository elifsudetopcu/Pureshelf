import 'package:flutter_test/flutter_test.dart';
import 'package:pureshelf/models/product.dart';

void main() {
  test('Product fromJson ve toJson çalışıyor', () {
    final json = {
      'id': 'p1',
      'name': 'Test Ürün',
      'category': 'Serum',
      'price': 100.0,
      'description': 'Açıklama',
      'image': 'assets/images/serum.png',
    };

    final product = Product.fromJson(json);

    expect(product.name, 'Test Ürün');
    expect(product.toJson()['price'], 100.0);
  });
}