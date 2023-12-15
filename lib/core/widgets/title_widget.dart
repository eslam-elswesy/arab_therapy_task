import 'package:flutter/material.dart';
import 'package:arab_therapy_task/core/consts/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'shimmer_widget.dart';


class TitleWidget extends StatelessWidget {
  final String title;
  final Widget? end;
  final bool isWaiting;
  const TitleWidget({super.key,required this.title,this.end,this.isWaiting=false});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 0.9.sw,
      child: Row(
        children: [
          Text(title,style: AppTextStyle.black_14,),
          Spacer(),
          isWaiting?
          SingleSimmerWidget():
          end??Container()
        ],
      ),
    );
  }
}
