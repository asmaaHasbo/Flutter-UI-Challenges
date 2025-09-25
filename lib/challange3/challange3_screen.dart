// الشاشة الرئيسية
// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:task2_clean_arch_and_widgets_tour/challange3/widgets/sequential_loading_dots.dart';

class LoadingDotsScreen extends StatelessWidget {
  const LoadingDotsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sequential Loading Dots',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(child: Center(child: SequentialLoadingDots())),
    );
  }
}


