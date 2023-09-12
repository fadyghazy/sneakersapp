/*
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  const MapSample({Key? key}) : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
   static final Marker _KGooglePlexMarker=Marker(markerId: MarkerId('_KGooglePlex'),infoWindow: InfoWindow(
     title: 'Google Plex',
   ),icon: BitmapDescriptor.defaultMarker,position: LatLng(37.42796133580664, -122.085749655962),
     
   );
  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);
  static final Marker _KLakeMarker=Marker(markerId: MarkerId('_KLakeMarker'),infoWindow: InfoWindow(
    title: 'Lake',
  ),icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),position: LatLng(37.43296265331129, -122.08832357078792),

  );
  static final Polyline _Kpolyline=Polyline(polylineId: PolylineId(' _Kpolyline'),points: [
    LatLng(37.43296265331129, -122.08832357078792),
    LatLng(37.42796133580664, -122.085749655962),
  ],color: Colors.red,width: 5);
  static final Polygon _Kpolygon=Polygon(polygonId: PolygonId(' _Kpolygon'),points: [
    LatLng(37.43296265331129, -122.08832357078792),
    LatLng(37.42796133580664, -122.085749655962),
    LatLng(37.418, -122.092),
    LatLng(37.435, -122.092),

  ],strokeWidth: 5,fillColor: Colors.transparent);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.terrain,
        markers: {
        _KGooglePlexMarker,
          _KLakeMarker
        },
        polylines: {
          _Kpolyline
        },
        polygons: {
          _Kpolygon
        },
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: const Text('To the lake!'),
        icon: const Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}*/