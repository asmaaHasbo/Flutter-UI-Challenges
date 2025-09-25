// إعدادات الأنيميشن
import 'package:flutter/material.dart';

class AnimationConfig {
  static const Duration animationDuration = Duration(milliseconds: 500);
  static const Duration delayBetweenDots = Duration(
    milliseconds: 50,
  ); // قللت التأخير
  static const Duration cyclePause = Duration(
    milliseconds: 5,
  ); // فترة راحة بين الدورات
  static const int numberOfDots = 3;
  static const double maxScale = 1.4; // قللت الحجم شوية
  static const double minOpacity = 0.3;
  static const double maxOpacity = 1.0;
  static const double dotSize = 14.0;
  static const Color dotColor = Colors.blue;
}
