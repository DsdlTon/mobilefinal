import 'package:flutter/material.dart';
import 'package:mobilefinal2/ui/home.dart';
import 'package:mobilefinal2/ui/login.dart';
import 'package:mobilefinal2/ui/register.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: LoginPage(),
      ),
      routes: {
        '/LoginPage': (context) => LoginPage(),
        '/RegisterPage': (context) => RegisterPage(),
        '/HomePage': (context) => HomePage(),
      },
    );
  }
}