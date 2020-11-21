import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:primer_chapoteo/global/custom_color.dart';
import 'package:primer_chapoteo/models/car.dart';
import 'package:primer_chapoteo/ui/item_hot_car.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Completer<GoogleMapController> _controller = Completer();
  List<Car> cars;
  CameraPosition initialPos = CameraPosition(
    target: LatLng(-12.104061, -76.962902),
    zoom: 19,
  );

  @override
  void initState() {
    // TODO: implement initState
    getPosition();
    cars = new List<Car>();
    cars.add(new Car(
        name: "Alpha Speed",
        brand: "Aston Martin",
        price: 320.0,
        stars: 5.0,
        opinion: 20));
    cars.add(new Car(
        name: "Bravo Speed",
        brand: "Aston Martin",
        price: 320.0,
        stars: 4.0,
        opinion: 20));
    cars.add(new Car(
        name: "Gaa Speed",
        brand: "Aston Martin",
        price: 320.0,
        stars: 2.5,
        opinion: 20));
    cars.add(new Car(
        name: "Alpha 2 Speed",
        brand: "Aston Martin",
        price: 320.0,
        stars: 1.0,
        opinion: 20));
    cars.add(new Car(
        name: "Alpha 3 Speed",
        brand: "Aston Martin",
        price: 320.0,
        stars: 4.8,
        opinion: 20));
    super.initState();
  }

  Map<String, Marker> markers = {};
  Position position;

  void getPosition() async {
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    initialPos = CameraPosition(
      target: LatLng(position.latitude, position.longitude),
      zoom: 19,
    );
    List<LatLng> positions = new List<LatLng>();
    positions.add(initialPos.target);
    positions.add(new LatLng(-12.104061, -76.962902));
    positions.add(new LatLng(-12.055623817645479, -77.08433839575153));
    positions.add(new LatLng(-11.975535, -77.060665));
    for (int i = 0; i < positions.length; i++) {
      markers[i.toString()] = new Marker(
          markerId: MarkerId(i.toString()),
          position: positions[i],
          infoWindow: InfoWindow(
            title: "Esto es una prueba",
          ),
          onTap: () {
            print(markers[i.toString()].position);
          });
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: position != null
              ? Stack(
            children: [
              GoogleMap(
                mapType: MapType.normal,
                markers: markers.values.toSet(),
                initialCameraPosition: initialPos,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),
              Positioned(
                left: 20,
                top: 20,
                child: GestureDetector(
                  onTap:(){
                      Navigator.pop(context);
                  },
                  child: Container(
                    width: 45,
                    margin: EdgeInsets.only(bottom: 10),
                    height: 45,
                    child: Icon(Icons.keyboard_arrow_left,
                        color: CustomColor.black),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white),
                  ),
                ),
              ),
              DraggableScrollableSheet(initialChildSize: 0.3, builder: (BuildContext context,ScrollController scrollController){
                return SingleChildScrollView(
                    controller: scrollController,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white
                      ),
                      child: ListView.builder(
                          itemCount: cars.length,
                          physics:
                          new NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, i) {
                            return ItemHotCar(
                              car: cars[i],
                            );
                          }),
                    ),
                );
              })
            ],
          )
              : Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
