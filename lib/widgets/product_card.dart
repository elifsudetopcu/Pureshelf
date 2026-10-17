import 'package:flutter/material.dart';
import '../models/product.dart';
import '../screens/product_detail_screen.dart';
import 'product_image.dart';

// Liste ve ana sayfada kullanilan urun karti.
class ProductCard extends StatelessWidget {
  final Product product;
  // Detaydan geri donuldugunde sepet sayisini yenilemek icin.
  final VoidCallback? onReturn;

  const ProductCard({super.key, required this.product, this.onReturn});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Urun, Route Arguments ile detay sayfasina tasinir.
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ProductDetailScreen(),
            settings: RouteSettings(arguments: product),
          ),
        ).then((_) => onReturn?.call());
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFEDE6D6)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(16)),
                child: ProductImage(path: product.image),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 2),
              child: Text(
                product.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: Text(
                '${product.price.toStringAsFixed(2)} ₺',
                style: const TextStyle(color: Color(0xFF6B8268)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
