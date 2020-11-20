import 'package:flutter/material.dart';
import 'package:primer_chapoteo/global/custom_color.dart';
import 'package:primer_chapoteo/models/car.dart';

class ItemInfoCar extends StatefulWidget {
  final Car car;

  const ItemInfoCar({Key key, this.car}) : super(key: key);

  @override
  _ItemInfoCar createState() => _ItemInfoCar();
}

class _ItemInfoCar extends State<ItemInfoCar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: EdgeInsets.only(left: 10, right: 10),
      child: Stack(
        children: [
          Positioned(
              child: Container(
                margin: EdgeInsets.only(left: 15, right: 15,top: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(widget.car.name),
                    Text(widget.car.price.toString())
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text(widget.car.brand), Text("/day")],
                ),
              ],
            ),
          )),
          Positioned(
              bottom: 0,
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow),
                      Text(widget.car.stars.toString()),
                      Text("(${widget.car.opinion})")
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 0.25,
                        child: Text("Details"),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 0.25,
                        child: Text("Rent"),
                      ),
                    ],
                  )
                ],
              ))
        ],
      ),
      decoration: BoxDecoration(
          color: CustomColor.greyCar, borderRadius: BorderRadius.circular(20)),
      height: 200,
    );
  }
}
