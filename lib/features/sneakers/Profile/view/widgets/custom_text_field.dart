
import 'package:flutter/material.dart';

class CustomProfileTextField extends StatefulWidget {
  final int maxLines;
  final String label;
  final String text;
  final ValueChanged<String>OnChanged;

  const CustomProfileTextField({Key? key, required this.label, required this.text, required this.OnChanged,this.maxLines=1}) : super(key: key);

  @override
  State<CustomProfileTextField> createState() => _CustomProfileTextFieldState();
}

class _CustomProfileTextFieldState extends State<CustomProfileTextField> {
 late final  TextEditingController controller;
 @override
  void initState() {

    super.initState();
    controller=TextEditingController(text:widget.text);
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       Text(widget.label,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
        const SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            )
          ),
          controller:controller ,
          maxLines: widget.maxLines,
          onChanged: widget.OnChanged,

        )


      ],
    );
  }
}


