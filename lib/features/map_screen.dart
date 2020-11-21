import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen>{
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition initialPos = CameraPosition(
      target: LatLng(-12.104061,-76.962902),
      zoom: 19,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: initialPos,
            onMapCreated: (GoogleMapController controller){
              _controller.complete(controller);
            },

          ),
        ),
      ),
    );
  }

}