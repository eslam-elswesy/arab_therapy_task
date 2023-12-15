import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:arab_therapy_task/core/consts/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ClipRRect(
//   borderRadius: _border,
//   child: ShimmerWidget.rectangular(
//     height: 20.h,
//     width: 0.2.sw,
//   ),
// ),

class ShimmerWidget extends StatelessWidget {
  final double width;
  final double height;
  final ShapeBorder shapeBorder;

  const ShimmerWidget.rectangular(
      {this.width = double.infinity, required this.height})
      : this.shapeBorder = const RoundedRectangleBorder();

  const ShimmerWidget.circular(
      {this.width = double.infinity,
        required this.height,
        this.shapeBorder = const CircleBorder()});

  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
    baseColor: Colors.grey[300]!,
    highlightColor: Colors.grey[100]!,
    period: Duration(milliseconds: 1500),
    child: Container(
      width: width,
      height: height,
      decoration: ShapeDecoration(
        color: AppColors.black,
        shape: shapeBorder,
      ),
    ),
  );
}

class SingleSimmerWidget extends StatelessWidget {
  final BorderRadius? borderRadius;
  final double? width;
  final double? height;
  const SingleSimmerWidget({super.key,this.width,this.height,this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius??BorderRadius.circular(15),
      child: ShimmerWidget.rectangular(
        width: width??0.2.sw,height:height?? 20.h,
      ),
    );
  }
}
