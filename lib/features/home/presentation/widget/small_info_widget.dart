import 'package:flutter/material.dart';
import 'package:arab_therapy_task/core/consts/icons_assets_constants.dart';
import 'package:arab_therapy_task/core/consts/strings_assets_constants.dart';
import 'package:arab_therapy_task/core/consts/text_styles.dart';
import 'package:arab_therapy_task/core/widgets/icon_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SmallInfoWidget extends StatelessWidget {
  final String icon,title,content;
  const SmallInfoWidget({super.key,required this.icon,required this.title,required this.content,});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          SvgWidget(icon,width: 0.04.sw,height: 0.04.sw,),
          Text(title,style: AppTextStyle.white_12,),
          Text(content,style: AppTextStyle.white_12BOLD,),

        ],
      ),
    );
  }
}
