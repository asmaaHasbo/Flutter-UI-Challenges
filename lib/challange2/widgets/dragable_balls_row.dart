// صف الكور القابلة للسحب
import 'package:flutter/material.dart';
import 'package:task2_clean_arch_and_widgets_tour/challange2/widgets/draggable_ball.dart';

class DragableBallsRow extends StatelessWidget {
  const DragableBallsRow({super.key, required this.availableBalls});

  final List<DraggableBall> availableBalls;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: availableBalls.map((ball) {
        return Draggable<DraggableBall>(
          data: ball,
          feedback: Material(
            color: Colors.transparent,
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: ball.color,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues( alpha:0.3),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
            ),
          ),
          childWhenDragging: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: ball.color.withValues( alpha:.3),
              shape: BoxShape.circle,
              border: Border.all(
                color: ball.color.withValues( alpha:0.5),
                width: 2,
                style: BorderStyle.solid,
              ),
            ),
          ),
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: ball.color,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: ball.color.withValues( alpha:0.3),
                  blurRadius: 8,
                  spreadRadius: 1,
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
