// صندوق الهدف
import 'package:flutter/material.dart';
import 'package:task2_clean_arch_and_widgets_tour/challange2/widgets/draggable_ball.dart';

class DragTargetBox extends StatelessWidget {
  const DragTargetBox({
    super.key,
    required this.targetColor,
    required this.acceptedBalls,
    required this.onAccept,
  });

  final Color targetColor;
  final List<DraggableBall> acceptedBalls;
  final Function(DraggableBall) onAccept;

  @override
  Widget build(BuildContext context) {
    return DragTarget<DraggableBall>(
      builder:
          (
            BuildContext context,
            List<DraggableBall?> candidateData,
            List<dynamic> rejectedData,
          ) {
            bool hasValidCandidate = candidateData.any(
              (data) => data != null && data.color == targetColor,
            );

            Color boxColor = acceptedBalls.isNotEmpty
                ? acceptedBalls[0]
                      .color // لون البوكس يتغير للون الكرة الموجودة
                : (hasValidCandidate
                      ? targetColor.withValues( alpha:0.8)
                      : targetColor.withValues( alpha:0.3));

            return AnimatedContainer(
              duration: Duration(milliseconds: 200),
              width: double.infinity,
              height: 120,
              decoration: BoxDecoration(
                color: boxColor,
                border: Border.all(
                  color: acceptedBalls.isNotEmpty
                      ? acceptedBalls[0].color
                      : targetColor,
                  width: acceptedBalls.isNotEmpty || hasValidCandidate ? 4 : 2,
                ),
                borderRadius: BorderRadius.circular(12),
                boxShadow: (acceptedBalls.isNotEmpty || hasValidCandidate)
                    ? [
                        BoxShadow(
                          color:
                              (acceptedBalls.isNotEmpty
                                      ? acceptedBalls[0].color
                                      : targetColor)
                                  .withValues( alpha:  0.4),
                          blurRadius: 15,
                          spreadRadius: 3,
                        ),
                      ]
                    : null,
              ),
              child: Center(
                child: acceptedBalls.isNotEmpty
                    ? Icon(Icons.check, color: Colors.white, size: 40)
                    : (hasValidCandidate
                          ? Icon(Icons.check, color: Colors.white, size: 40)
                          : SizedBox.shrink()), // شيل أيقونة الـ download إلا لو الكرة مش match
              ),
            );
          },
      onWillAcceptWithDetails: (DragTargetDetails<DraggableBall> details) {
        return details.data.color == targetColor;
      },
      onAcceptWithDetails: (DragTargetDetails<DraggableBall> details) {
        onAccept(details.data);
      },
     
    );
  }
}
