import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier{
  final List _shopItems = [
    ["Banana","4.00","lib/images/banana.png",Colors.yellow],
    ["Water","2.00","lib/images/bottle.png",Colors.blue],
    ["Watermelon","2.50","lib/images/watermelon.png",Colors.redAccent],
    ["Apple","3.50","lib/images/red_apple.png",Colors.red],
    ["Mango","7.50","lib/images/mango.png",Colors.yellow],
    ["juice","8.00","lib/images/juice.png",Colors.orange],
  ];
  

  //list of cart items
  List _cartItems = [];

  get shopItems => _shopItems;

  get cartItems => _cartItems;

  void addItemToCart(int index){
    _cartItems.add(_shopItems[index]);
    notifyListeners();
   }

  void removeItemFromCart(index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

String calculateTotal() {
  double totalPrice = 0;
  for(int i= 0; i<_cartItems.length;i++){
    totalPrice = totalPrice + double.parse(_cartItems[i][1]);

  }
  return totalPrice.toStringAsFixed(2);
}


}






