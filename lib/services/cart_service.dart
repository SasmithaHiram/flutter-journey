import 'package:flutter/foundation.dart';
import '../models/product.dart';

class CartItem {
  final Product product;
  final int quantity;
  const CartItem(this.product, this.quantity);

  CartItem copyWith({Product? product, int? quantity}) =>
      CartItem(product ?? this.product, quantity ?? this.quantity);
}

class CartService extends ChangeNotifier {
  final Map<String, CartItem> _items = {};

  List<CartItem> get items => _items.values.toList();
  int get count => _items.values.fold<int>(0, (sum, ci) => sum + ci.quantity);
  double get total => _items.values.fold<double>(
    0,
    (sum, ci) => sum + ci.product.price * ci.quantity,
  );

  void add(Product p) {
    final existing = _items[p.id];
    if (existing == null) {
      _items[p.id] = CartItem(p, 1);
    } else {
      _items[p.id] = existing.copyWith(quantity: existing.quantity + 1);
    }
    notifyListeners();
  }

  void decrease(String productId) {
    final existing = _items[productId];
    if (existing == null) return;
    if (existing.quantity <= 1) {
      _items.remove(productId);
    } else {
      _items[productId] = existing.copyWith(quantity: existing.quantity - 1);
    }
    notifyListeners();
  }

  void remove(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}
