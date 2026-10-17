// Urun modeli: JSON'daki bir urunu temsil eder.
class Product {
  final String id;
  final String name;
  final String category;
  final double price;
  final String description;
  final String image;

  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.description,
    required this.image,
  });

  // JSON'dan (Map) Product nesnesi olusturur.
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as String,
      name: json['name'] as String,
      category: json['category'] as String,
      price: (json['price'] as num).toDouble(),
      description: json['description'] as String,
      image: json['image'] as String,
    );
  }

  // Product nesnesini JSON'a (Map) cevirir.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'price': price,
      'description': description,
      'image': image,
    };
  }
}
