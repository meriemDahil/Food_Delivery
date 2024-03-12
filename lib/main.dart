import 'package:flutter/material.dart';
import 'package:food_delivery/presentation/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Food Delivery',
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}


