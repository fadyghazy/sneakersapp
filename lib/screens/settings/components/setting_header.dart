
import 'package:flutter/material.dart';
import 'package:sneakers_store/translate.dart';

class SettingsHeader extends StatelessWidget {
  const SettingsHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(Translate.SettingsText,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)

        ]
    );
  }
}
