
import 'package:flutter/material.dart';
import 'package:arab_therapy_task/features/meals/presentation/controllers/calories_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:arab_therapy_task/features/meals/presentation/widget/calories_chart_widget.dart';

Future<dynamic>  openShowCaloriesReportDialog(BuildContext context,CaloriesController controller,
    {
      required String totalCalories,
      required String currentCalories,
      required String totalFats,
      required String currentFats,
      required String totalProtein,
      required String currentProtein,
      required String totalCarb,
      required String currentCarb,
    }) {
  return showDialog(
      context: context,
      builder: (ctx) =>
          StatefulBuilder(builder: (context, setState) {
            return Dialog(
              insetPadding: EdgeInsets.all(10.h),
              shape: const RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.all(Radius.circular(15.0))),
              child: CaloriesReportWidget(
                totalCalories: totalCalories,
                currentCalories: currentCalories,
                totalFats: totalFats,
                currentFats: currentFats,
                totalCarb: totalCarb,
                currentCarb: currentCarb,
                totalProtein: totalProtein,
                currentProtein: currentProtein,
              )
            );
          }));
}