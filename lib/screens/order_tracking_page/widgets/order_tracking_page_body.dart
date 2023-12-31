
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:sneakers_store/constants.dart';
import 'package:sneakers_store/core/utils/user_preferences/user_preferences.dart';

class OrderTrackingPageBody extends StatefulWidget {
  const OrderTrackingPageBody({Key? key}) : super(key: key);
  @override
  State<OrderTrackingPageBody> createState() => _OrderTrackingPageBodyState();
}

class _OrderTrackingPageBodyState extends State<OrderTrackingPageBody> {
  final Completer<GoogleMapController>_controller=Completer();
  static const LatLng sourceLocation =LatLng(37.33500926, -122.03272188);
  static const LatLng destination = LatLng(37.33429383, -122.06600055);
  List<LatLng>polylineCoordinates=[];
  LocationData? currentLocation;
  BitmapDescriptor sourceIcon=BitmapDescriptor.defaultMarker;
  BitmapDescriptor destinationIcon=BitmapDescriptor.defaultMarker;
  BitmapDescriptor currentLocationIcon=BitmapDescriptor.defaultMarker;

  void getCurrentLocation()async{
    Location location = Location();
    location.getLocation().then((location) => currentLocation=location);
    GoogleMapController googleMapController=await _controller.future;
    location.onLocationChanged.listen((newLoc) {
      currentLocation=newLoc;
      googleMapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
          zoom: 13.5,
          target: LatLng(newLoc.latitude!,newLoc.longitude!,))));

      setState(() {

      });
    });
  }

  void getPolyPoints()async{
    PolylinePoints polylinePoints=PolylinePoints();
    PolylineResult result=await polylinePoints.getRouteBetweenCoordinates(google_api_key,PointLatLng(sourceLocation.latitude, sourceLocation.longitude),PointLatLng(destination.latitude,destination.longitude));
    if(result.points.isNotEmpty){
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));

        setState(() {

        });

      });

    }
  }
  void setCustomMarkerIcon() {
    BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, "").then((icon) {
      sourceIcon = icon;
    }
    );
    BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, "").then((icon) {
      destinationIcon = icon;
    }
    );
    BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, "").then((icon) {
      currentLocationIcon = icon;
    }
    );
  }

  @override
  void initState() {
    getCurrentLocation();
    getPolyPoints();
    setCustomMarkerIcon();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Track order",style: TextStyle(color: Colors.black,fontSize: 16,),
        ),

      ),
      body:currentLocation==null?Center(child:Text("Loading")):GoogleMap(initialCameraPosition: CameraPosition(target:LatLng(currentLocation!.latitude!,currentLocation!.longitude!),zoom: 13.5),
        polylines: {
          Polyline(
              polylineId: PolylineId("route"),
              points:polylineCoordinates,
              color: Colors.blue,width: 6
          )
        },
        markers: {
          Marker(markerId:const  MarkerId("Currentlocation"),
              icon: currentLocationIcon,
              position: LatLng(currentLocation!.latitude!,currentLocation!.longitude!)),
          Marker(markerId: MarkerId("destination"),position: destination,icon: destinationIcon,),

          Marker(markerId: MarkerId("source"),
              icon: sourceIcon,
              position: sourceLocation),

        },
        onMapCreated: (mapController){
          _controller.complete(mapController);
        }
        ,
      ),

    );

  }
}
