// النقطة المتحركة
import 'package:flutter/material.dart';
import 'package:task2_clean_arch_and_widgets_tour/challange3/widgets/dot_widget.dart';

class AnimatedDot extends StatelessWidget {
  final Animation<double> scaleAnimation;
  final Animation<double> opacityAnimation;

  const AnimatedDot({
    super.key,
    required this.scaleAnimation,
    required this.opacityAnimation,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([scaleAnimation, opacityAnimation]),
      builder: (context, child) {
        return Transform.scale(
          scale: scaleAnimation.value,
          child: Opacity(opacity: opacityAnimation.value, child: DotWidget()),
        );
      },
    );
  }
}
