import 'package:carrosel_flutter/home_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicação Carrosel Flutter',
      theme: ThemeData(
        primaryColor: Colors.blue
      ),
      home: HomePage()
    );
  }
}