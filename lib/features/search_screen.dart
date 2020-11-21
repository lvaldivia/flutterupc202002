import 'package:flutter/material.dart';
import 'package:primer_chapoteo/global/custom_color.dart';
import 'package:primer_chapoteo/models/car.dart';
import 'package:primer_chapoteo/ui/item_hot_car.dart';
import 'package:primer_chapoteo/ui/item_info_car.dart';

class SearchScreen extends StatefulWidget {
  final String typeService;

  SearchScreen({this.typeService});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Car> cars;
  @override
  void initState() {
    cars = new List<Car>();
    cars.add(new Car(name: "Alpha Speed",brand:"Aston Martin",price: 320.0,stars: 5.0,opinion: 20));
    cars.add(new Car(name: "Bravo Speed",brand:"Aston Martin",price: 320.0,stars: 4.0,opinion: 20));
    cars.add(new Car(name: "Gaa Speed",brand:"Aston Martin",price: 320.0,stars: 2.5,opinion: 20));
    cars.add(new Car(name: "Alpha 2 Speed",brand:"Aston Martin",price: 320.0,stars: 1.0,opinion: 20));
    cars.add(new Car(name: "Alpha 3 Speed",brand:"Aston Martin",price: 320.0,stars: 4.8,opinion: 20));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
                margin: EdgeInsets.only(left: 20, right: 10, top: 50),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image(
                              width: 50,
                              image: AssetImage("assets/images/picture.png")),
                          Container(
                              width: MediaQuery.of(context).size.width * 0.75,
                              height: 50,
                              child: Row(
                                children: [
                                  Icon(Icons.location_on_outlined),
                                  Expanded(
                                    child: TextField(
                                      maxLines: 1,
                                      maxLength: 200,
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.black),
                                      keyboardType: TextInputType.text,
                                      textCapitalization:
                                          TextCapitalization.words,
                                      decoration: InputDecoration(
                                        counterText: "",
                                        border: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              decoration: BoxDecoration(
                                  color: CustomColor.grey,
                                  borderRadius: BorderRadius.circular(20)))
                        ],
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 20),
                          child: Column(
                            children: [
                              Image(
                                  image: AssetImage(
                                      'assets/images/icon_voucher.png')),
                              Text('No Location',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                              Text('Please enter your location',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold))
                            ],
                          )),
                      Container(
                        height: 300,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: cars.length,
                            shrinkWrap: true,
                            itemBuilder: (context, i) {
                              return ItemInfoCar(car: cars[i],);
                            }),
                      ),
                     Container(
                       child:  ListView.builder(
                           itemCount: cars.length,
                           physics: new NeverScrollableScrollPhysics(),
                           shrinkWrap: true,
                           itemBuilder: (context, i) {
                             return ItemHotCar(car: cars[i],);
                           }),
                     )
                    ],
                  ),
                ),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height)));
  }
}
