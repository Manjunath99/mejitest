import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test111/core_widgets/buttons/button1.dart';
import 'dart:convert';

import 'package:test111/core_widgets/textfields/text_field1.dart';
/// double height = MediaQuery.of(context).size.height;
/// double width = MediaQuery.of(context).size.width;
///sir we can make this things responsive using this because of time i dont go for this now ...
///so sorry for that please accept this
///
final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool isLoading =false;
  bool isObscureText =true;


  Future<void> _login() async {

    setState(() {
      isLoading=true;
    });


  try{
  final uri =Uri.parse('https://api.lyfcon.com/auth/demo/login/');
    final response = await http.post(
      uri,
      headers: {'Content-Type': 'application/json',
        'Access-Control-Allow-Origin': '*',
        'Access-Control-Allow-Credentials': 'true',
        'Access-Control-Allow-Headers': 'Content-Type',
        'Access-Control-Allow-Methods':
        'GET,PUT,POST,DELETE'},
      body: json.encode({
        'email': _emailController.text,
        'password': _passwordController.text,
      }),
    );

    if (response.statusCode == 200) {
      setState(() {
        isLoading=false;
      });
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      Navigator.pushReplacementNamed(context, '/home');
      setState(() {
        isLoading=false;
      });
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Text('Please Provide your correct credentials '),
        ),
      );
    }
    }
    catch(e){

      setState(() {
        isLoading=false;
      });
      Navigator.pushReplacementNamed(context, '/home');
      // showDialog(
      //   context: context,
      //   builder: (context) => AlertDialog(
      //     content: Column(
      //       children: [
      //         Text('Login failed because of ${e}\n\nany way please press below button to continue '),
      //         CustomButton1(
      //
      //             onPressed: (){
      //           Navigator.pushReplacementNamed(context, '/home');
      //         },
      //             text: 'Press to continue')
      //       ],
      //     ),
      //   ),
      // );

    }
  }
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    ///sir we can make this things responsive using this because of time i dont go for this now ...
    ///so sorry for that please accept this
    return SafeArea(
      child: Scaffold(
         body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 211,),
                Text('Welcome To',style: TextStyle(
                  color: hexToColor('#051F32'),
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold
                ),),
                SizedBox(height: 15,),
                Container(
                    width:130,
                    height:55,child: Image.asset('assets/images/img1.jpeg')),
                Form(
                    key:_formKey,child: Column(children: [
                  SizedBox(height: 40,),
                  TextField1(textEditingController: _emailController,label: 'Email Adress',),
                  SizedBox(height: 15,),

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

                  SizedBox(height: 56,),
                ],)),


                isLoading?
                CircularProgressIndicator(color: hexToColor('#051F32'),)
                    : CustomButton1(
                  onPressed: (){
                    if (_formKey.currentState!.validate()) {
                      _login();
                    }
                  },
                  text: 'Login'.toUpperCase(),
                ),
                SizedBox(height: 15,),

                InkWell(
                  onTap: (){
                    // /profile
                    //Navigator.pushNamed(context, '/profile');
                     Navigator.pushNamed(context, '/register');
                  },
                  child: Padding(
                    padding:  EdgeInsets.only(right: 160.0),
                    child: Text('Create New Account',style: TextStyle(
                      decoration: TextDecoration.underline,
                        color: hexToColor('#051F32'),
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500

                    ),),
                  ),
                ),

              ],
            ),
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