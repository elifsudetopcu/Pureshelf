import 'package:flutter/material.dart';
import '../data/cart_service.dart';
import '../models/product.dart';
import '../widgets/product_image.dart';

// Urun detayi. Urun, Route Arguments ile gelir.
class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Route Arguments'tan urunu al.
    final product = ModalRoute.of(context)!.settings.arguments as Product;

    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: SizedBox(
              height: 300,
              child: ProductImage(path: product.image),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            product.category,
            style: const TextStyle(color: Color(0xFF6B8268)),
          ),
          const SizedBox(height: 4),
          Text(
            product.name,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            '${product.price.toStringAsFixed(2)} ₺',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),
          Text(product.description, style: const TextStyle(height: 1.5)),
          const SizedBox(height: 24),
          FilledButton.icon(
            onPressed: () {
              CartService.add(product);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${product.name} sepete eklendi')),
              );
            },
            icon: const Icon(Icons.add_shopping_cart),
            label: const Text('Sepete Ekle'),
          ),
        ],
      ),
    );
  }
}
