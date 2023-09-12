
import 'package:flutter/material.dart';

class InformationButton extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;
  const InformationButton({Key? key, required this.text, required this.onClicked}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(onPrimary: Colors.white,shape: const StadiumBorder(),padding: const EdgeInsets.symmetric(horizontal: 32,vertical: 12)),


        onPressed:onClicked, child: Text(text));
  }
}
