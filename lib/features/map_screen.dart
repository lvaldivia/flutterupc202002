import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Completer<GoogleMapController> _controller = Completer();

  CameraPosition initialPos = CameraPosition(
    target: LatLng(-12.104061, -76.962902),
    zoom: 19,
  );

  @override
  void initState() {
    // TODO: implement initState
    getPosition();
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
              ? GoogleMap(
                  mapType: MapType.normal,
                  markers: markers.values.toSet(),
                  initialCameraPosition: initialPos,
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                )
              : Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
