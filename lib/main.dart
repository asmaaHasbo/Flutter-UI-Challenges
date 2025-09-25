import 'package:flutter/material.dart';
import 'package:task2_clean_arch_and_widgets_tour/challange2/challange2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  ChallangeTwo(),
    );
  }
}
