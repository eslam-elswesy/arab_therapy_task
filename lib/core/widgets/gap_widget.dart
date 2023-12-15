import 'package:flutter/material.dart';
import 'package:arab_therapy_task/core/consts/app_colors.dart';

class GapWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? color;
  const GapWidget({super.key,this.height,this.width,this.color});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: width??0,
      height: height??0,
      color: color??AppColors.transparentColor,
    );
  }
}
