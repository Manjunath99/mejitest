

import 'package:flutter/material.dart';


class SearchField extends StatelessWidget {
  final TextEditingController? textEditingController;
  final String label;
  final Widget? preffixWidget;
  final bool? isNumber;

  // TextEditingController textControllerThree=TextEditingController();

  SearchField(
      {Key? key, required this.textEditingController, required this.label,this.preffixWidget,this.isNumber})
      : super(key: key);

  @override
  Widget build(BuildContext context, ) {


    return
      TextFormField(
        decoration: InputDecoration(
          filled: true, // Enables filling the background color
          fillColor: hexToColor('#DDDDDD'), // Sets the background color to red
         label: Text(label),
          labelStyle: TextStyle(
            color: hexToColor('#707070')
          ),
          prefixIcon: Icon(Icons.search, color: hexToColor('#707070')), // Search icon
          suffixIcon: Icon(Icons.filter_list, color: hexToColor('#707070')), // Filter icon
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0), // Rounded corners
            borderSide: BorderSide.none, // No border
          ),
          hintStyle: TextStyle(color: Colors.white), // Hint text color
        ),
        style: TextStyle(color: Colors.white), // Text color
      );
  }
}
Color hexToColor(String hexString) {
  hexString = hexString.replaceAll("#", ""); // Remove the '#' if present
  return Color(int.parse("FF$hexString", radix: 16)); // Add FF for alpha, default fully opaque
}
