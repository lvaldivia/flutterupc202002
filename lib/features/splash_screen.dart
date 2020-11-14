import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:primer_chapoteo/global/custom_color.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              alignment: Alignment.center,
              child: Image(
                  width: 200, image: AssetImage("assets/images/logo.png")),
            ),
            Positioned(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      print("HOLA");
                    },
                    child: Container(
                      width: 45,
                      margin: EdgeInsets.only(bottom: 10),
                      height: 45,
                      child:
                          Icon(Icons.keyboard_arrow_right, color: Colors.white),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: CustomColor.mainColor),
                    ),
                  ),
//                  SizedBox(height: 20,),
                  Text(
                    "GO",
                    style: TextStyle(
                      color: CustomColor.mainColor,
                      fontSize: 18,
                    ),
                  )
                ],
              ),
              right: 60,
              bottom: 50,
            ),
          ],
        ),
      ),
    ));
  }
}
