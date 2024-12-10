import 'package:e_appp/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddToCart extends ChangeNotifier {
  List<Product> _favorites = [];

  List<Product> get favorites => _favorites;

  void togglFavorite(Product product) {
    if (_favorites.contains(product)) {
      _favorites.remove(product);
      // Check if the product is already in the cart.
      for (Product element in _favorites) {
        // if it is already in the cart, it increments the quantity.
        element.quantity++;
      }
    } else {
      // if its not exist, it will add the product to the list.
      _favorites.add(product);
    }
    // notify listener widgets.
    notifyListeners();
  }

  void addToFavorite(Product product) {
    if (favorites.contains(product)) {
      product.quantity++;
    } else {
      favorites.add(product);
    }
    notifyListeners();
  }

  bool isExist(Product product) {
    final isExist = _favorites.contains(product);

    return isExist;
  }

  int checkQuantity() {
    int quantity = _favorites.length;

    return quantity;
  }

  static AddToCart of(
    BuildContext context, {
    bool listen = true,
  }) {
    return Provider.of<AddToCart>(context, listen: true);
  }
}
