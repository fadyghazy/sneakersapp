
import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:sneakers_store/constants.dart';
import 'package:sneakers_store/features/sneakers/main/view/widgets/navigation_page.dart';
import 'package:sneakers_store/screens/order_tracking_page/order_tracking_page.dart';
import 'package:sneakers_store/screens/order_tracking_page/widgets/map.dart';
import 'package:sneakers_store/screens/order_tracking_page/widgets/map_sample.dart';
import 'package:sneakers_store/screens/order_tracking_page/widgets/map_sample2.dart';
import 'package:sneakers_store/screens/order_tracking_page/widgets/map_screen.dart';
import 'package:sneakers_store/screens/order_tracking_page/widgets/map_view_body.dart';
import 'package:sneakers_store/screens/order_tracking_page/widgets/order_tracking_page_body.dart';

class MapView extends NavigationPage {
  const MapView({super.key}) : super(icon: Icons.map_outlined);

  static const routeName = '/map';

  @override
  Widget build(BuildContext context) {
    return MapViewBody();



  }
}
