import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CarDetailScreen extends StatefulWidget {
  @override
  _CarDetailState createState() => _CarDetailState();
}

class _CarDetailState extends State<CarDetailScreen> {
  int frame = 1;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [

                ],
              ),
              GestureDetector(
                onTap: () {
                  frame = frame == 3 ? 1 : frame + 1;
                  setState(() {});
                },
                child: Container(
                  alignment: Alignment.center,
                  child:
                      Image(image: AssetImage('assets/images/car$frame.png')),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child:
                Image(image: AssetImage('assets/images/rotate.png')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
