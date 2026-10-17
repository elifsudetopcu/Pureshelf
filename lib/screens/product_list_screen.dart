import 'package:flutter/material.dart';
import '../data/cart_service.dart';
import '../data/product_service.dart';
import '../models/product.dart';
import '../widgets/product_card.dart';
import 'cart_screen.dart';

// Tum urunler: arama + kategori filtresi + iki sutunlu GridView.
class ProductListScreen extends StatefulWidget {
  final String? initialCategory;

  const ProductListScreen({super.key, this.initialCategory});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  List<Product> _all = [];
  bool _loading = true;
  String? _error;
  String _query = '';
  String _category = 'Tümü';

  @override
  void initState() {
    super.initState();
    _category = widget.initialCategory ?? 'Tümü';
    _load();
  }

  Future<void> _load() async {
    try {
      final products = await ProductService.loadProducts();
      setState(() {
        _all = products;
        _loading = false;
      });
    } catch (e) {
      setState(() {
        _error = 'Ürünler yüklenemedi: $e';
        _loading = false;
      });
    }
  }

  List<String> get _categories {
    final names = _all.map((p) => p.category).toSet().toList();
    return ['Tümü', ...names];
  }

  List<Product> get _filtered {
    return _all.where((p) {
      final matchCategory = _category == 'Tümü' || p.category == _category;
      final matchQuery = p.name.toLowerCase().contains(_query.toLowerCase());
      return matchCategory && matchQuery;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tüm Ürünler'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartScreen()),
              ).then((_) => setState(() {}));
            },
            icon: Badge(
              label: Text('${CartService.totalCount}'),
              isLabelVisible: CartService.totalCount > 0,
              child: const Icon(Icons.shopping_bag_outlined),
            ),
          ),
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_loading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (_error != null) {
      return Center(child: Text(_error!));
    }
    final products = _filtered;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
          child: TextField(
            onChanged: (value) => setState(() => _query = value),
            decoration: InputDecoration(
              hintText: 'Ürün ara...',
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(vertical: 0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: const BorderSide(color: Color(0xFFEDE6D6)),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 44,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            itemCount: _categories.length,
            itemBuilder: (context, index) {
              final name = _categories[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: ChoiceChip(
                  label: Text(name),
                  selected: _category == name,
                  onSelected: (_) => setState(() => _category = name),
                ),
              );
            },
          ),
        ),
        Expanded(
          child: products.isEmpty
              ? const Center(child: Text('Ürün bulunamadı.'))
              : GridView.builder(
                  padding: const EdgeInsets.all(16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 0.72,
                  ),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return ProductCard(
                      product: products[index],
                      onReturn: () => setState(() {}),
                    );
                  },
                ),
        ),
      ],
    );
  }
}
