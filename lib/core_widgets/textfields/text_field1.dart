

import 'package:flutter/material.dart';


class TextField1 extends StatelessWidget {
  final TextEditingController? textEditingController;
  final String label;
  final Widget? preffixWidget;
  final bool? isNumber;


  TextField1(
      {Key? key, required this.textEditingController, required this.label,this.preffixWidget,this.isNumber})
      : super(key: key);

  @override
  Widget build(BuildContext context, ) {


    return
      TextFormField(
        controller: textEditingController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },

        decoration: InputDecoration(

          // Hint text that appears above when focused
          labelText: label,
          labelStyle: TextStyle(
            color: hexToColor('#B8B8B8'),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          border: UnderlineInputBorder(),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color:  hexToColor('#B8B8B8')),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: hexToColor('#B8B8B8'), width: 2.0),
          ),
        ),
      );
  }
}
Color hexToColor(String hexString) {
  hexString = hexString.replaceAll("#", "");
  return Color(int.parse("FF$hexString", radix: 16));
}
