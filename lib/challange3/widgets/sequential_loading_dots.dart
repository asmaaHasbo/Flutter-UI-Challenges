
// ignore_for_file: avoid_print

// المكون الرئيسي للنقط المتحركة
import 'package:flutter/material.dart';
import 'package:task2_clean_arch_and_widgets_tour/challange3/widgets/animation_config.dart';
import 'package:task2_clean_arch_and_widgets_tour/challange3/widgets/dots_container.dart';

class SequentialLoadingDots extends StatefulWidget {
  const SequentialLoadingDots({super.key});
  
  @override
  State<StatefulWidget> createState() {
    return _SequentialLoadingDotsState();
  }
}

class _SequentialLoadingDotsState extends State<SequentialLoadingDots>
    with TickerProviderStateMixin {
  List<AnimationController> _controllers = [];
  List<Animation<double>> _scaleAnimations = [];
  List<Animation<double>> _opacityAnimations = [];
  bool _isAnimating = false;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startSequentialAnimations();
    });
  }

  // تهيئة الأنيميشنز
  void _initializeAnimations() {
    // إنشاء controllers آمن
    _controllers = List.generate(AnimationConfig.numberOfDots, (index) {
      return AnimationController(
        duration: AnimationConfig.animationDuration,
        vsync: this,
      );
    });

    // إنشاء scale animations
    _scaleAnimations = _controllers.asMap().entries.map((entry) {
      return Tween<double>(
        begin: 1.0,
        end: AnimationConfig.maxScale,
      ).animate(CurvedAnimation(parent: entry.value, curve: Curves.easeInOut));
    }).toList();

    // إنشاء opacity animations
    _opacityAnimations = _controllers.asMap().entries.map((entry) {
      return Tween<double>(
        begin: AnimationConfig.minOpacity,
        end: AnimationConfig.maxOpacity,
      ).animate(CurvedAnimation(parent: entry.value, curve: Curves.easeInOut));
    }).toList();
  }

  // بدء الأنيميشنز المتسلسلة مع الحماية من الأخطاء
  void _startSequentialAnimations() async {
    if (!mounted || _isAnimating) return;

    _isAnimating = true;

    while (mounted && _isAnimating) {
      try {
        // تشغيل كل نقطة بتسلسل
        for (int i = 0; i < AnimationConfig.numberOfDots; i++) {
          if (!mounted || !_isAnimating || i >= _controllers.length) break;

          // بدء الأنيميشن للنقطة
          _animateDot(i);

          // انتظار قبل بدء النقطة التالية (هنا بيحصل التقاطع)
          await Future.delayed(AnimationConfig.delayBetweenDots);
        }

        // انتظار انتهاء آخر أنيميشن + فترة راحة
        await Future.delayed(
          AnimationConfig.animationDuration + AnimationConfig.cyclePause,
        );
      } catch (e) {
        break;
      }
    }
  }

  // تشغيل أنيميشن نقطة واحدة
  void _animateDot(int index) async {
    if (!mounted || index >= _controllers.length) return;

    try {
      // تشغيل الأنيميشن للأمام
      await _controllers[index].forward();

      // إرجاع الأنيميشن للخلف بعد انتهائه
      if (mounted && index < _controllers.length) {
        await _controllers[index].reverse();
      }
    } catch (e) {
      print('Dot animation error for index $index: $e');
    }
  }

  @override
  void dispose() {
    _isAnimating = false;

    // التخلص من كل الـ controllers بأمان
    for (int i = 0; i < _controllers.length; i++) {
      try {
        _controllers[i].dispose();
      } catch (e) {
        print('Controller disposal error: $e');
      }
    }
    _controllers.clear();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DotsContainer(
      scaleAnimations: _scaleAnimations,
      opacityAnimations: _opacityAnimations,
    );
  }
}
