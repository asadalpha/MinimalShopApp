import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/components/model/card_model.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Consumer<CartModel>(
        builder: (context, value, child) {
          return Column(
            children: [
              Text(
                "Your Cart",
                style: GoogleFonts.notoSerif(
                    fontWeight: FontWeight.bold, fontSize: 26),
              ),
              value.cartItems.isEmpty ? Center(child: Text("Cart is Empty")):
              Expanded(
                child: ListView.builder(
                    itemCount: value.cartItems.length,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: ListTile(
                              leading: Image.asset(
                                value.cartItems[index][2],
                                height: 40,
                              ),
                              title: Text(value.cartItems[index][0]),
                              subtitle: Text('\$ ' + value.cartItems[index][1]),
                              trailing: IconButton(
                                onPressed: () => Provider.of<CartModel>(context,
                                        listen: false)
                                    .removeItemFromCart(index),
                                icon: const Icon(Icons.remove),
                              ),
                            ),
                          ));
                    }),
              ),
              value.cartItems.isEmpty? Column(children: [
                SizedBox(height: 485,),
                Button(value),
              ],):
              Button(value)
            ],
          );
        },
      ),
    );
  }

  Padding Button(CartModel value) {
    return Padding(
              padding: const EdgeInsets.all(36.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(8)),
                padding: const EdgeInsets.all(24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Total Price",
                          style: TextStyle(color: Colors.green[200]),
                        ),
                        Text(
                          value.calculateTotal(),
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Container(
                      child: Row(
                        children: const [
                          Text(
                            "Pay Now",
                            style: TextStyle(color: Colors.white),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            );
  }
}
