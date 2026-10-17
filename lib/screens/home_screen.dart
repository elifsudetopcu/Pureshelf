import 'package:flutter/material.dart';
import '../data/cart_service.dart';
import '../data/product_service.dart';
import '../models/product.dart';
import '../widgets/product_card.dart';
import 'cart_screen.dart';
import 'product_list_screen.dart';

// Ana sayfa: marka, tanitim, kategoriler, one cikan urunler.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Product>> _future;

  @override
  void initState() {
    super.initState();
    _future = ProductService.loadProducts();
  }

  void _openCart() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CartScreen()),
    ).then((_) => setState(() {}));
  }

  void _openList({String? category}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductListScreen(initialCategory: category),
      ),
    ).then((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'PureShelf',
          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1),
        ),
        actions: [
          IconButton(
            onPressed: _openCart,
            icon: Badge(
              label: Text('${CartService.totalCount}'),
              isLabelVisible: CartService.totalCount > 0,
              child: const Icon(Icons.shopping_bag_outlined),
            ),
          ),
        ],
      ),
      body: FutureBuilder<List<Product>>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Ürünler yüklenemedi: ${snapshot.error}'));
          }
          final products = snapshot.data!;
          final categories = products.map((p) => p.category).toSet().toList();
          final featured = products.take(4).toList();

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              // Karsilama alani
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFFF1EADB),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Cildine nazik bakım',
                      style: TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'PureShelf ile sade ve etkili cilt bakım ürünlerini keşfet.',
                      style: TextStyle(height: 1.4),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Kategoriler
              const Text(
                'Kategoriler',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: categories.map((name) {
                  return ActionChip(
                    label: Text(name),
                    onPressed: () => _openList(category: name),
                  );
                }).toList(),
              ),
              const SizedBox(height: 24),

              // One cikan urunler
              const Text(
                'Öne Çıkanlar',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 230,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: featured.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 160,
                      margin: const EdgeInsets.only(right: 12),
                      child: ProductCard(
                        product: featured[index],
                        onReturn: () => setState(() {}),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),

              FilledButton(
                onPressed: () => _openList(),
                child: const Text('Tüm Ürünleri Gör'),
              ),
            ],
          );
        },
      ),
    );
  }
}
