import 'package:flutter/material.dart';
import 'package:shop_app/screens/navigator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Roboto'),
      title: 'Shop App',
      home: MainNavigator(),
    );
  }
}