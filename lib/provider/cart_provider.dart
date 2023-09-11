// ______________________________________________________________________________
// developed---by---mughaltechlab----saqib--ahmed
// --------------------------I_________N_____F__________O-----------------
// github: mughaltechlab-----------------whatsapp: 923111377533 ----------------------
// _____________________________________________________________________________

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../util/book.dart';

class CartProvider extends ChangeNotifier {
  List<Book> _cart = [];
  double _totalPrice = 0;

  List<Book> get cart => _cart;
  double get totalPrice => _totalPrice;

  void addToCart(Book book) {
    _cart.add(book);
    _totalPrice += book.price;

    _saveCartToPreferences();
    notifyListeners();
  }

  void removeFromCart(Book book) {
    _cart.remove(book);
    _totalPrice -= book.price;

    _saveCartToPreferences();
    notifyListeners();
  }

  void _saveCartToPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> cartStrings = _cart.map((book) => book.title).toList();
    await prefs.setStringList('cart', cartStrings);
    await prefs.setDouble('totalPrice', _totalPrice);
  }

  Future<void> loadCartFromPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? cartStrings = prefs.getStringList('cart');
    if (cartStrings != null) {
      _cart = cartStrings.map((title) {
        return Book(title: title, author: '', price: 0, description: '');
      }).toList();
    }

    _totalPrice = prefs.getDouble('totalPrice') ?? 0;
    notifyListeners();
  }
}
