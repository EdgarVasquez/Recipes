import 'package:flutter/material.dart';
import 'package:fuentes/loader.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wheather',
      home: Scaffold(
        appBar: AppBar(

          title: Center(
              child:
              Text(
                  'Recipe Calculator')
          ),
          backgroundColor: Colors.grey,
        ),
          body:Loading()
      ),
    );
  }
}