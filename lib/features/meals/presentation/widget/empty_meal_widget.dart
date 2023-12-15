import 'package:flutter/material.dart';
import 'package:arab_therapy_task/core/consts/images_assets_constants.dart';
import 'package:arab_therapy_task/core/consts/strings_assets_constants.dart';
import 'package:arab_therapy_task/core/consts/text_styles.dart';

class EmptyMealWidget extends StatelessWidget {
  const EmptyMealWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Image.asset(ImagesAssetsConstants.noDish),
          Text(StringsAssetsConstants.no_added_dishes,style: AppTextStyle.grey_12,)
        ],
      ),
    );
  }
}
