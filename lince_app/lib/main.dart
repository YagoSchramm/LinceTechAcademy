import 'package:flutter/material.dart';
import 'package:lince_app/view/home/home.dart';

void main() {
  runApp(const MyApp());
}
class MyApp  extends StatelessWidget {
  const MyApp ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}