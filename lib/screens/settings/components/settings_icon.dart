
import 'package:flutter/material.dart';

class SettingsIcon extends StatelessWidget {
  final IconData icon;
  final Color color;
  const SettingsIcon({Key? key, required this.icon, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(
          shape: BoxShape.circle,color: color
      ),
      child: Icon(icon,color: Colors.white,),
    );
  }
}
