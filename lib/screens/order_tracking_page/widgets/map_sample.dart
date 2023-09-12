/*import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sneakers_store/screens/order_tracking_page/location_service.dart';

class MapSample extends StatefulWidget {
  const MapSample({Key? key}) : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();
  TextEditingController _originController=TextEditingController();
  TextEditingController _destinationController=TextEditingController();
  Set<Marker>_markers=Set<Marker>();
  Set<Polygon>_polygons=Set<Polygon>();
  Set<Polyline>_polylines=Set<Polyline>();
  List<LatLng>polygonLatLngs=<LatLng>[];

  int _polygonIdCounter=1;
  int _polylineIdCounter=2;
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _setMarker(LatLng(37.42796133580664, -122.085749655962));

  }
  void _setPolyline(List<LatLng>points){
    final String polylineIdVal='polyline_$_polylineIdCounter';
    _polylineIdCounter++;
    _polylines.add(Polyline(polylineId: PolylineId(polylineIdVal),
        width: 2,color: Colors.blue,points:points.map((point)=>LatLng(point.latitude,point.longitude)).toList()),

    );

  }
  void _setMarker(LatLng point){
    setState(() {
      _markers.add(Marker(markerId: MarkerId('marker'),position: point),);

    });
  }

/*
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  static final Marker _KGooglePlexMarker=Marker(
    markerId:MarkerId("_KGooglePlex"),infoWindow: InfoWindow(
    title: "Google Plex"
  ),icon: BitmapDescriptor.defaultMarker,
    position:LatLng(37.42796133580664, -122.085749655962),
     );
  static final Marker _KLakeMarker=Marker(markerId:MarkerId("_KLakeMarker"),infoWindow: InfoWindow(
      title: "Lake"
  ),icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),position:LatLng(37.43296265331129, -122.08832357078792),
  );
  static final Polyline _KPolyline=Polyline(polylineId: PolylineId('_KPolyline'),points: [LatLng(37.42796133580664, -122.085749655962),
    LatLng(37.43296265331129, -122.08832357078792)],width: 5,color: Colors.blue);
  static final Polygon _KPolygon =Polygon(polygonId: PolygonId('_KPolygon',

  ),points:  [LatLng(37.42796133580664, -122.085749655962),
    LatLng(37.43296265331129, -122.08832357078792),
    LatLng(37.418, -122.092),
    LatLng(37.435, -122.092)],strokeWidth: 5,
    fillColor: Colors.transparent
    
  );




  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);
*/ void _setPolygon(){
  final String polygonIdVal='polygon_$_polygonIdCounter';
  _polygonIdCounter++;
  _polygons.add(Polygon(polygonId: PolygonId(polygonIdVal),
  points: polygonLatLngs,strokeWidth: 2,fillColor: Colors.transparent));

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Google Maps"),),
      body: Column(

        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    TextFormField(
                      controller: _originController,
                      decoration: const InputDecoration(
                          hintText: "Origin"
                      ),
                      onChanged: (value){
                        print(value);
                      },
                    ),
                    TextFormField(
                      controller: _destinationController,
                      decoration: const InputDecoration(
                          hintText: "Destination"
                      ),
                      onChanged: (value){
                        print(value);
                      },
                    ),
                  ],
                ),
              ),
             IconButton(onPressed: ()async{
               var directions=await
                LocationServices().getDirections(_originController.text,_destinationController.text);
               _goToplace(directions['start_location']['lat'],directions['start_location']['lng']
                   ,directions['bounds-ne'],
                 directions['bounds-sw']

               );
               _setPolyline(directions['polyline_decoded']);
              }, icon:Icon(Icons.search))
            ],
          ),
         /* Row(
children: [
  Expanded(
      child:

  ),
  IconButton(onPressed: ()async{
   var place=await LocationServices().getPlace(_searchController.text);
   _goToplace(place);
  }, icon:Icon(Icons.search))
],
          ),*/
        Expanded(
          child: GoogleMap(
            mapType: MapType.normal,
            markers: _markers,
            polygons: _polygons,
            polylines: _polylines,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);

            },
            onTap: (point) {
             setState(() {
               polygonLatLngs.add(point);
               _setPolygon();



             });
            }
          ),
        ),
      ]
      ),
    /*  floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: const Text('To the lake!'),
        icon: const Icon(Icons.directions_boat),
      ),*/
    );
  }
  Future<void> _goToplace(
      /*Map<String,dynamic>place*/
      double lat,lng,
          Map<String,dynamic>boundsNe,Map<String,dynamic>boundsSw) async {
   // final double lat =place['geometry']['location']['lat'];
   // final double lng =place['geometry']['location']['lng'];
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(
      lat,lng
    ),zoom: 12)));
    controller.animateCamera(
      CameraUpdate.newLatLngBounds(LatLngBounds(southwest: LatLng(
        boundsSw['lat'],boundsSw['lng'],
      ), northeast: LatLng(
        boundsNe['lat'],boundsNe['lng'],
      ), ), 25)
    );
    _setMarker(LatLng(lat, lng));
  }


  /*
  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }*/
}*/
