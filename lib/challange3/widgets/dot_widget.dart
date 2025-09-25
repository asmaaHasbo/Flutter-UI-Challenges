// شكل النقطة
import 'package:flutter/material.dart';
import 'package:task2_clean_arch_and_widgets_tour/challange3/widgets/animation_config.dart';

class DotWidget extends StatelessWidget {
  const DotWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AnimationConfig.dotSize,
      height: AnimationConfig.dotSize,
      decoration: BoxDecoration(
        color: AnimationConfig.dotColor,
        shape: BoxShape.circle,
        // إضافة ظل خفيف للنقطة
        boxShadow: [
          BoxShadow(
            color: AnimationConfig.dotColor.withValues(alpha: 0.3),
            blurRadius: 4,
            spreadRadius: 1,
          ),
        ],
      ),
    );
  }
}
