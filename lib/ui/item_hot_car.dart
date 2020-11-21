import 'package:flutter/material.dart';
import 'package:primer_chapoteo/global/custom_color.dart';
import 'package:primer_chapoteo/models/car.dart';

class ItemHotCar extends StatefulWidget {
  final Car car;

  const ItemHotCar({Key key, this.car}) : super(key: key);

  @override
  _ItemHotCar createState() => _ItemHotCar();
}

class _ItemHotCar extends State<ItemHotCar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 10, bottom: 10),
        child: Row(
          children: [
            Stack(
              children: [
                Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                        color: CustomColor.greyCar,
                        borderRadius: BorderRadius.circular(20))),
                Positioned(
                  top: 80,
                  child:
                      Image(image: AssetImage('assets/images/pngfind 8.png')),
                ),
              ],
            ),
            SizedBox(width: 50,),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("A"),
                    Text("A"),
                  ],
                ),
                Text("A"),
                Text("A"),
              ],
            )
          ],
        ));
  }
}
