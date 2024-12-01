import 'package:e_appp/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartProvider extends ChangeNotifier {
  final List<Product> _cart = [];
  // _cart is a private List of 'product' object that represents the items currently in the cart.
  List<Product> get cart => _cart;
  void togglFavorite(Product product) {
    if (_cart.contains(product)) {
      // Check if the product is already in the cart.
      for (Product element in _cart) {
        // if it is already in the cart, it increments the quantity.
        element.quantity++;
      }
    } else {
      // if its not exist, it will add the product to the list.
      _cart.add(product);
    }
    // notify listener widgets.
    notifyListeners();
  }

  incrementQtn(int index) => _cart[index].quantity++;
  decrementQtn(int index) => _cart[index].quantity--;

  totalPrice() {
    double total1 = 0.0;
    for (Product element in _cart) {
      total1 += element.price * element.quantity;
    }
    return total1;
  }

  static CartProvider of(
    BuildContext context, {
    bool lsiten = true,
  }) {
    return Provider.of<CartProvider>(context, listen: true);
  }

  // void addProduct(Product product) {
  //   product.quantity++;
  // }
}
