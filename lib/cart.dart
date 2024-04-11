
import 'package:flutter/material.dart';

import 'product.dart';

class Cart with ChangeNotifier {
  final List<Product> _products = [];

  List<Product> get products => _products;

  void addProduct(Product product) {
    _products.add(product);
    notifyListeners();
  }

  void removeProduct(Product product) {
    _products.remove(product);
    notifyListeners();
  }

  double get totalAmount {
    return _products.fold(0, (sum, product) => sum + product.price);
  }

  void clear() {
    _products.clear();
    notifyListeners();
  }
}