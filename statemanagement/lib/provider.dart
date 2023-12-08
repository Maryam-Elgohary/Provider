import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  int cart = 0;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  incCart() {
    cart++;
    notifyListeners();
  }

  decCart() {
    if (cart > 0) {
      cart--;
    }
    notifyListeners();
  }
}
