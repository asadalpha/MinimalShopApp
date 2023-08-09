import 'package:flutter/material.dart';

class GroceryItemTile extends StatelessWidget {
  GroceryItemTile(
      {Key? key,
      required this.itemName,
      required this.itemPrice,
      required this.imagePath,
      this.color,
      required this.onPressed})
      : super(key: key);

  final String itemName;
  final String itemPrice;
  final String imagePath;
  final color;
  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              imagePath,
              height: 64,
            ),
            //image

            //name of item
            Text(itemName),

            TextButton(
              onPressed: onPressed,
              child: Text('\$ ' + itemPrice),
              style: TextButton.styleFrom(
                backgroundColor: color[400],
                primary: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
