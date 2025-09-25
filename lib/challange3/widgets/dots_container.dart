// حاوية النقط مع تقاطع بسيط
import 'package:flutter/material.dart';
import 'package:task2_clean_arch_and_widgets_tour/challange3/widgets/animated_dot.dart';
import 'package:task2_clean_arch_and_widgets_tour/challange3/widgets/animation_config.dart';

class DotsContainer extends StatelessWidget {
  final List<Animation<double>> scaleAnimations;
  final List<Animation<double>> opacityAnimations;

  const DotsContainer({
    super.key,
    required this.scaleAnimations,
    required this.opacityAnimations,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(AnimationConfig.numberOfDots, (index) {
        // تحقق من صحة الـ index
        if (index >= scaleAnimations.length ||
            index >= opacityAnimations.length) {
          return SizedBox.shrink(); // إرجاع widget فاضي لو في مشكلة
        }

        return Padding(
          // تقليل المسافة بين النقط لعمل تقاطع بسيط
          padding: EdgeInsets.symmetric(horizontal: 2), // كان 4 بقى 2
          child: AnimatedDot(
            scaleAnimation: scaleAnimations[index],
            opacityAnimation: opacityAnimations[index],
          ),
        );
      }),
    );
  }
}
