import 'package:flutter/material.dart';

// Image.asset ile gorsel gosterir. Dosya yoksa uygulama cokmez,
// yerine basit bir yer tutucu gosterilir.
class ProductImage extends StatelessWidget {
  final String path;
  final BoxFit fit;

  const ProductImage({super.key, required this.path, this.fit = BoxFit.cover});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path,
      fit: fit,
      width: double.infinity,
      height: double.infinity,
      errorBuilder: (context, error, stackTrace) {
        return Container(
          color: const Color(0xFFF1EADB),
          child: const Center(
            child: Icon(Icons.spa_outlined, size: 40, color: Color(0xFF8FA58B)),
          ),
        );
      },
    );
  }
}
