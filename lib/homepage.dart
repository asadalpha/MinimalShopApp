import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/cartpage.dart';
import 'package:shop_app/components/model/card_model.dart';
import 'components/grocery_item_tile.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context,MaterialPageRoute(builder: (context){
          return const CartPage();
        })),
        backgroundColor: Colors.black,
        child: const Icon(Icons.shopping_bag),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40,),

            //good morning
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text("Good Morning"),
            ),
            const SizedBox(height: 4,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text("Lets order fresh items for you",style: GoogleFonts.notoSerif(
                  fontWeight: FontWeight.bold,
                  fontSize: 36
              ),),
            ),
            //LEts order fresh items

            // divider
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Divider(),
            ),
            const SizedBox(height: 24,),

            //fresh items +grid
            const Padding(
              padding: EdgeInsets.symmetric(horizontal:
              24.0),
              child: Text("Fresh Items",style: TextStyle(fontSize: 16),),
            ),
            Expanded(
                child: Consumer<CartModel>(
                  builder:(context,value,child) {
                    return GridView.builder(

                        itemCount: value.shopItems.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 1/1.3,
                            crossAxisCount: 2),
                        itemBuilder: (context, index) {
                          return GroceryItemTile(
                            itemName: value.shopItems[index][0],
                            itemPrice: value.shopItems[index][1],
                            imagePath: value.shopItems[index][2],
                            color: value.shopItems[index][3],
                            onPressed: (){
                              Provider.of<CartModel>(context,listen: false).addItemToCart(index);
                            },
                          );
                        }
                    );
                  })
            )],
        ),
      ),
    );
  }
}
