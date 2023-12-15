import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SvgWidget extends StatelessWidget {
  final String icon;
  final double? height;
  final double? width;
  final double? padding;
  final Color? color;
  final BoxFit? fit;
  SvgWidget(this.icon, {this.height, this.width, this.padding, this.color, this.fit});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding ?? 2.w),
      child: color == null
          ? SvgPicture.asset(
              icon,
              fit: fit != null
                  ? fit!
                  :  BoxFit.fill,
              height: height ?? 25.w,
              width: width ?? 25.w,
            )
          : SvgPicture.asset(
              icon,
              fit: fit != null
                  ? fit!
                  :  BoxFit.fill,
        height: height ?? 25.w,
        width: width ?? 25.w,
              color: color,
            ),
    );
  }
}
