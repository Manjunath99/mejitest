import 'package:flutter/material.dart';

class CustomButton1 extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final String? color;

  const CustomButton1({required this.text, required this.onPressed,this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 325,
        height: 55,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        decoration: BoxDecoration(
          color: color==null?hexToColor("#2D2B75"):hexToColor(color!), // Button color

        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white, // Text color
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
Color hexToColor(String hexString) {
  hexString = hexString.replaceAll("#", "");
  return Color(int.parse("FF$hexString", radix: 16));
}