import 'package:flutter/material.dart';
import 'package:sneakers_store/screens/order_tracking_page/widgets/current_location.dart';
import 'package:sneakers_store/screens/order_tracking_page/widgets/nearby_places_screen.dart';
import 'package:sneakers_store/screens/order_tracking_page/widgets/polyline_screen.dart';
import 'package:sneakers_store/screens/order_tracking_page/widgets/search_places_screen.dart';
import 'package:sneakers_store/screens/order_tracking_page/widgets/simple_map_screen.dart';
class MapViewUi extends StatefulWidget {
  const MapViewUi({Key? key}) : super(key: key);

  @override
  _MapViewUiState createState() => _MapViewUiState();
}

class _MapViewUiState extends State<MapViewUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Google Maps"),
        centerTitle: true,
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            ElevatedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                return const SimpleMapScreen();
              }));
            }, child: const Text("Simple Map")),

            ElevatedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                return const CurrentLocationScreen();
              }));
            }, child: const Text("User current location")),

            ElevatedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                return const SearchPlacesScreen();
              }));
            }, child: const Text("Search Places")),


            ElevatedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                return const NearByPlacesScreen();
              }));
            }, child: const Text("Near by Places")),


            ElevatedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                return const PolylineScreen();
              }));
            }, child: const Text("Polyline between 2 points"))

          ],
        ),
      ),
    );

  }
}