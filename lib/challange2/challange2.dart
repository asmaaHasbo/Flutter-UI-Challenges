import 'package:flutter/material.dart';
import 'package:task2_clean_arch_and_widgets_tour/challange2/widgets/drag_target_box.dart';
import 'package:task2_clean_arch_and_widgets_tour/challange2/widgets/dragable_balls_row.dart';
import 'package:task2_clean_arch_and_widgets_tour/challange2/widgets/draggable_ball.dart';

class ChallangeTwo extends StatefulWidget {
  const ChallangeTwo({super.key});

  @override
  State<ChallangeTwo> createState() => _ChallangeTwoState();
}

class _ChallangeTwoState extends State<ChallangeTwo> {
  // الكور الأصلية المتاحة للسحب
  List<DraggableBall> availableBalls = [
    DraggableBall(id: 'red_1', color: Colors.red),
    DraggableBall(id: 'blue_1', color: Colors.blue),
    DraggableBall(id: 'green_1', color: Colors.green),
  ];

  // الكور اللي اتحطت في كل صندوق
  List<DraggableBall> redBoxBalls = [];
  List<DraggableBall> blueBoxBalls = [];
  List<DraggableBall> greenBoxBalls = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDF2F8),
      appBar: AppBar(
        backgroundColor: Color(0xFFFDF2F8),
        
        title: Text(
          'Physics Playground',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // المنطقة العلوية - الكور القابلة للسحب
            Expanded(
              flex: 2,
              child: Center(
                child: DragableBallsRow(availableBalls: availableBalls),
              ),
            ),

            // المنطقة السفلية - الصناديق
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // صندوق أحمر
                  Expanded(
                    child: DragTargetBox(
                      targetColor: Colors.red,
                      acceptedBalls: redBoxBalls,
                      onAccept: (DraggableBall ball) {
                        setState(() {
                          // إضافة الكرة للصندوق بدون إزالتها من الأصلية
                          redBoxBalls.add(ball);
                        });
                      },
                    ),
                  ),
                  SizedBox(width: 10),

                  // صندوق أزرق
                  Expanded(
                    child: DragTargetBox(
                      targetColor: Colors.blue,
                      acceptedBalls: blueBoxBalls,
                      onAccept: (DraggableBall ball) {
                        setState(() {
                          blueBoxBalls.add(ball);
                        });
                      },
                    ),
                  ),
                  SizedBox(width: 10),

                  // صندوق أخضر
                  Expanded(
                    child: DragTargetBox(
                      targetColor: Colors.green,
                      acceptedBalls: greenBoxBalls,
                      onAccept: (DraggableBall ball) {
                        setState(() {
                          greenBoxBalls.add(ball);
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

