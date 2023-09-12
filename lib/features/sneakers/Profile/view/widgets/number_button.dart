
import 'package:flutter/material.dart';
class NumberButton extends StatelessWidget {
  final String value;
  final String text;
  const NumberButton({Key? key, required this.value, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.symmetric(vertical: 4),

      onPressed: (){},

      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(value,style: TextStyle(fontWeight: FontWeight.bold,fontSize:20 ),
          ),
         const SizedBox(height: 2),
          Text(text,style: const TextStyle(fontWeight: FontWeight.bold),)
        ],
      ),
    );
  }
}
