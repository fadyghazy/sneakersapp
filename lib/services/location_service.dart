
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;
import 'dart:convert'as convert;

import 'package:location/location.dart';

class LocationServices {
  Future<LocationData>getLocation()async{
    Location location =new Location();
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;
    _serviceEnabled =await location.serviceEnabled();
    if(!_serviceEnabled){
      _serviceEnabled = await  location.requestService();
      if(!_serviceEnabled){
        throw Exception();
      }
    }
    _permissionGranted =await location.hasPermission();
    if(_permissionGranted==PermissionStatus.denied){
      if(_permissionGranted!=PermissionStatus.granted){
        throw Exception();
      }
    }
    _locationData = await location.getLocation();
    return _locationData ;

  }
  final String key = "AIzaSyCkPymn6eOUp1TQjnMMlrvcGdCN18ZXkfk";

  Future<String> getPlaceId(String input) async {
    final String url = "https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=$input&inputtype=textquery&key=$key";
    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);
    var placeId = json['candidates'][0]['place-id'] as String;
    return placeId;
  }

  Future<Map<String, dynamic>>getPlace(String input) async {
    final placeId = await getPlaceId(input);
    final String url = "https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$key";
    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);
    var results = json['result'] as Map<String, dynamic>;
    print(results);
    return results;
  }
  Future<Map<String,dynamic>>getDirections(String origin,String destination)async{
    final String url = "https://maps.googleapis.com/maps/api/directions/json?origin$origin&destination$destination&key=$key";

    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);
    var results={
      'bounds_ne': json['routes'][0]['bounds']['northeast'],
      'bounds_sw': json['routes'][0]['bounds']['southwest'] ,
      'start_location':json['routes'][0]['legs'][0]['start_location'] ,
      'end_location':json['routes'][0]['legs'][0]['end_location'] ,
      'polyline':json['routes'][0]['overview_polyline']['points'] ,
      'polyline_decoded':PolylinePoints().decodePolyline(json['routes'][0]['overview_polyline']['points'])

    };
    print(results);
    return results;
  }
}