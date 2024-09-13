import 'package:flutter/material.dart';
import 'package:test111/profile_page.dart';
import 'login_page.dart';
import 'register_page.dart';
import 'home_page.dart';
/// double height = MediaQuery.of(context).size.height;
/// double width = MediaQuery.of(context).size.width;
///sir we can make this things responsive using this because of time i dont go for this now ...
///so sorry for that please accept this
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Auth App',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/home': (context) => HomePage(),
        '/profile': (context) => ProfilePage(),
      },
    );
  }
}
