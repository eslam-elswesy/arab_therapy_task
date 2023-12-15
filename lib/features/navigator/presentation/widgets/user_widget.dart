import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:arab_therapy_task/core/consts/app_colors.dart';
import 'package:arab_therapy_task/core/consts/container_style.dart';
import 'package:arab_therapy_task/core/consts/text_styles.dart';


class UserCard extends StatelessWidget {
  const UserCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 0.8.sw,
        decoration: AppContainerStyle.radiusAll8Shadow.copyWith(
            color: AppColors.rate
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.person,size: 30,color: AppColors.primaryColor,),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Member name",style: AppTextStyle.black_14,),
                Text("Islam Hassan",style: AppTextStyle.black_14BOLD,)
              ],
            )
          ],),
        ),
      ),
    );
  }
}
