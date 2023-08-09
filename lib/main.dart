import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/components/model/card_model.dart';
import 'intropaage.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context)=>CartModel(),
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: IntroPage(),
        ),

    );
  }
}
