import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test111/api_service.dart';
import 'package:test111/core_widgets/buttons/button1.dart';
import 'dart:convert';

import 'package:test111/core_widgets/textfields/text_field1.dart';
import 'package:http/http.dart';
final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
final TextEditingController _firstNameController = TextEditingController();
final TextEditingController _familyNameController = TextEditingController();
class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {


  Future<void> _register() async {
    setState(() {
      isLoading=true;
    });
    try{
      final uri =Uri.parse('https://api.lyfcon.com/auth/demo/create-user');
    final response = await http.post(
      uri, // Replace with your API
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'email': _emailController.text,
        'password': _passwordController.text,
        'firstName':_firstNameController.text,
        'lastName':_familyNameController.text,
      }),
    );

    if (response.statusCode == 200) {
      setState(() {
        isLoading=false;
      });
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      setState(() {
        isLoading=false;
      });

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Column(
            children: [
              Text('Registration failed,please try again after sometime'),
            TextButton(onPressed: (){
              Navigator.pushReplacementNamed(context, '/home');
            }, child: Text('Press to continue'))
            ],
          ),
        ),
      );
    }
    }catch(e){
      setState(() {
        isLoading=false;
      });
      Navigator.pushReplacementNamed(context, '/home');

      // showDialog(
      //   context: context,
      //   builder: (context) => AlertDialog(
      //     content: Column(
      //       children: [
      //         Text('Registration failed,because \n\n ${e}'),
      //         CustomButton1(
      //
      //             onPressed: (){
      //
      //               Navigator.pushReplacementNamed(context, '/home');
      //             },
      //             text: 'Press to continue')
      //       ],
      //     ),
      //   ),
      // );
    }
  }
  final _formKey = GlobalKey<FormState>();
  bool isLoading =false;
  bool isObscureText=false;




  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: SingleChildScrollView(
          child: Column(
            children: [

              SizedBox(height: 90,),
              Container(
                  width:187,
                  height:80,child: Image.asset('assets/images/img1.jpeg')),
              SizedBox(height: 50,),

              Text('Sign up with your email address',style: TextStyle(
                  color: hexToColor('#051F32'),
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold
              ),),
              SizedBox(height: 40,),
              Form(
                  key:_formKey,
                  child:Column(children: [
                    TextField1(textEditingController: _firstNameController,label: 'First Name',isNumber:true),
                    SizedBox(height: 5,),
                    TextField1(textEditingController: _familyNameController,label: 'Family Name',isNumber:true),
                    SizedBox(height: 5,),
                    TextField1(textEditingController: _emailController,label: 'Email Adress',isNumber:true),
                    SizedBox(height: 5,),
                    TextFormField(
                      controller: _passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      obscureText:isObscureText,

                      decoration: InputDecoration(
                        suffixIcon: InkWell(
                            onTap:(){
                              setState(() {
                                isObscureText=!isObscureText;
                              });
                            },child: Icon(Icons.remove_red_eye_rounded,color: Colors.black,)),


                        labelText: 'Password',
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
                    ),
                    // TextField1(textEditingController: _passwordController,label: 'Password',isNumber:true),
                    SizedBox(height: 22,),

              ],)),

              isLoading?
                  CircularProgressIndicator(color: hexToColor('#051F32'),)
                  : CustomButton1(
                onPressed:_register ,
                text: 'CREATE ACCOUNT',
              ),
              SizedBox(height: 5,),
              //
              // InkWell(
              //   onTap: (){
              //     Navigator.pushNamed(context, '/');
              //   },
              //   child: Padding(
              //     padding:  EdgeInsets.only(right: 250.0),
              //     child: Text('Login',style: TextStyle(
              //         decoration: TextDecoration.underline,
              //         color: hexToColor('#051F32'),
              //         fontSize: 14.0,
              //         fontWeight: FontWeight.w500
              //
              //     ),),
              //   ),
              // ),

            ],
          ),
        ),
      ),
    );
  }
}
Color hexToColor(String hexString) {
  hexString = hexString.replaceAll("#", ""); // Remove the '#' if present
  return Color(int.parse("FF$hexString", radix: 16)); // Add FF for alpha, default fully opaque
}
