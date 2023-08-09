import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'homepage.dart';
class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
            Padding(
              padding: const EdgeInsets.only(left: 80.0,right: 80.0,bottom: 80.0,top: 120),
              child: Image.asset("lib/images/logo.png"),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text("Delivering at your doorstep",textAlign: TextAlign.center,style: GoogleFonts.notoSerif(
                fontWeight: FontWeight.bold,
                fontSize: 36
              )),
            ),
          const SizedBox(height: 24,),
          Text("With Love",style: GoogleFonts.notoSerif(fontWeight: FontWeight.w400),),
          const Spacer(),
          GestureDetector(
            onTap: () =>Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context){
                  return HomePage();
                })),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF3688FF),
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(24),
              child: const Text(
                "Get Started",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          const Spacer(),


        ],
      ),
    );
  }
}
