import 'package:flutter/cupertino.dart';
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
    return Stack(
      children: [

        Container(
          width: 200,
          margin: EdgeInsets.only(left: 10, right: 50),
          child: Stack(
            children: [

              Positioned(
                  child: Container(
                    margin: EdgeInsets.only(left: 15, right: 15, top: 10),
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
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 15,bottom: 15),
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width * 0.26,
                            child: Text("Details"),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 15,bottom: 15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0),bottomRight: Radius.circular(25.0)),
                              color: CustomColor.mainColor,
                            ),
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width * 0.26,
                            child: Text(
                              "Rent",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      )
                    ],
                  ))
            ],
          ),
          decoration: BoxDecoration(
              color: CustomColor.greyCar, borderRadius: BorderRadius.circular(20)),
          height: 400,
        ),
        Positioned(
          top: 80,
          child: Image(
              image: AssetImage(
                  'assets/images/pngfind 8.png')),
        ),
      ],
    );
  }
}
