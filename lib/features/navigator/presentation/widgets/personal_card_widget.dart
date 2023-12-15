import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:arab_therapy_task/core/consts/app_colors.dart';
import 'package:arab_therapy_task/core/consts/container_style.dart';
import 'package:arab_therapy_task/core/consts/text_styles.dart';
import 'package:arab_therapy_task/features/navigator/presentation/widgets/user_widget.dart';


class PersonalCard extends StatelessWidget {
  const PersonalCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.9.sw,
      decoration: AppContainerStyle.radiusAll8Shadow.copyWith(
          color: AppColors.primaryColor
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(children: [
          UserCard(),
          Container(
            width: 0.8.sw,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 0.38.sw,
                  decoration: AppContainerStyle.radiusAll4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add),
                        Text("Add",style: AppTextStyle.black_14,)
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 0.38.sw,
                  decoration: AppContainerStyle.radiusAll4.copyWith(
                    color: AppColors.primaryColor,
                    border: Border.all(
                      width: 2,color: AppColors.white
                    )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.delete,color: AppColors.white,),
                        Text("Delete",style: AppTextStyle.white_14,)
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],),
      ),
    );
  }
}
