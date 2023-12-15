
import 'package:flutter/material.dart';
import 'package:arab_therapy_task/core/consts/logos_assets_constants.dart';
import 'package:arab_therapy_task/core/widgets/icon_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScaleTransitionAnimationWidget extends StatefulWidget {

  const ScaleTransitionAnimationWidget({super.key});

  @override
  State<ScaleTransitionAnimationWidget> createState() => _ScaleTransitionAnimationWidgetState();
}


class _ScaleTransitionAnimationWidgetState extends State<ScaleTransitionAnimationWidget>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child:  SvgWidget(LogosAssetsConstants.logoWhite,width: 100.w,height: 100.w,),
    );
  }
}