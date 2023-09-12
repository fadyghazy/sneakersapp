
import 'package:flutter/material.dart';

class EditIcon extends StatelessWidget {
  final Color color;
  final bool isEdit;
  const EditIcon({Key? key, required this.color,this.isEdit=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(

      child: Container(
        padding: EdgeInsets.all(3),
        color: color,
        decoration: BoxDecoration(
        ),
        child: Icon(
         isEdit?Icons.add_a_photo: Icons.edit,size: 20,color: Colors.white,
        ),
      ),
    );
  }
}
