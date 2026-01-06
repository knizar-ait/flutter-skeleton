import 'package:flutter/foundation.dart';

import '../data/product.dart';
import '../data/product_repository.dart';
import 'product_state.dart';

class ProductCubit extends ChangeNotifier {
  final ProductRepository _repository;

  ProductState _state = ProductInitial();
  ProductState get state => _state;

  List<Product> _products = [];

  ProductCubit(this._repository);

  void loadProducts() async {
    _state = ProductLoading();
    notifyListeners();

    try {
      _products = await _repository.fetchProducts();
      _state = ProductLoaded(_products);
      notifyListeners();
    } catch (e) {
      _state = ProductError('Failed to load products: $e');
      notifyListeners();
    }
  }

  void toggleFavorite(Product product) {
    final index = _products.indexWhere((p) => p.id == product.id);
    if (index != -1) {
      _products[index].isFavorite = !_products[index].isFavorite;
      _state = ProductLoaded(_products);
      notifyListeners();
    }
  }
}
