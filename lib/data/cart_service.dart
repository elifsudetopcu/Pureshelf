import '../models/product.dart';

// Sepetteki tek bir satir: urun + adet.
class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});
}

// Basit sepet mantigi. Tum ekranlar ayni listeyi kullanir.
class CartService {
  static final List<CartItem> items = [];

  static void add(Product product) {
    for (final item in items) {
      if (item.product.id == product.id) {
        item.quantity++;
        return;
      }
    }
    items.add(CartItem(product: product));
  }

  static void decrease(CartItem item) {
    if (item.quantity > 1) {
      item.quantity--;
    } else {
      items.remove(item);
    }
  }

  static void increase(CartItem item) {
    item.quantity++;
  }

  static void remove(CartItem item) {
    items.remove(item);
  }

  static void clear() {
    items.clear();
  }

  static int get totalCount {
    int total = 0;
    for (final item in items) {
      total += item.quantity;
    }
    return total;
  }

  static double get totalPrice {
    double total = 0;
    for (final item in items) {
      total += item.product.price * item.quantity;
    }
    return total;
  }
}
