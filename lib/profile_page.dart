import 'package:flutter/material.dart';
import 'package:test111/core_widgets/buttons/button1.dart';
import 'package:test111/core_widgets/textfields/text_field1.dart';

class ProfilePage extends StatelessWidget {
  void logout(BuildContext context) {
     print("User logged out.");
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController =TextEditingController();
    TextEditingController _firstNameController =TextEditingController();
    TextEditingController _lastNameController =TextEditingController();
    return SafeArea(
      child: Scaffold(

        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 23.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10,),
                Center(
                  child: Container(
                      width:89,
                      height:38,child: Image.asset('assets/images/img1.jpeg')),
                ),
                Divider(color: Colors.black,),

                SizedBox(height: 10,),
                Text(
                  'My Profile',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 30),
              Row(
                
                children: [
                  Container(
                    width: 2,
                    height: 57,
                    color: hexToColor('#2D2B75'),
                  ),
                  Container(
                    width: 330,
                    child: TextFormField(
                      controller: _firstNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: hexToColor('#F1F1F1'),
                        labelText: 'First name',
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
                  ),
                ],
              ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Container(
                      width: 2,
                      height: 57,
                      color: hexToColor('#2D2B75'),
                    ),
                    Container(
                      width: 330,
                      child: TextFormField(
                        controller: _lastNameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: hexToColor('#F1F1F1'),
                          labelText: 'Last name',
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
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Container(
                      width: 2,
                      height: 60,
                      color: hexToColor('#2D2B75'),
                    ),
                    Container(
                      width: 330,
                      child: TextFormField(
                        controller: _emailController,

                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: hexToColor('#F1F1F1'),
                          labelText: 'Email Adress',
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
                    ),
                  ],
                ),

                SizedBox(height: 45),
                CustomButton1(
                  onPressed: (){},
                  text: 'Update my account'.toUpperCase().toUpperCase(),
                ),
                SizedBox(height: 30),
                CustomButton1(
                  onPressed: (){
                    Navigator.pushReplacementNamed(context, '/');

                  },
                  color: '#2D2B75',

                  text: 'LOGOUT'.toUpperCase().toUpperCase(),
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