
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:arab_therapy_task/core/consts/app_colors.dart';
import 'package:arab_therapy_task/core/consts/container_style.dart';
import 'package:arab_therapy_task/core/consts/text_styles.dart';
import 'package:arab_therapy_task/models/util_model.dart';

// for list of String only
class DropDownListOfString extends StatelessWidget {
  List<String> dataList;
  String? selected;
  String label;
  double? width;
  bool isLabelOutside;
  String hint;
  Function(String) changeSelectedItem;
  FocusNode focusNode;
  FocusNode? nextNode;
  String? error;

  DropDownListOfString({super.key,
    required this.dataList,
    required this.selected,
    required this.label,
    required this.hint,
    required this.focusNode,
    required this.changeSelectedItem,
    this.width,
    this.nextNode,
    this.error,
    this.isLabelOutside = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        children: [
          isLabelOutside
              ? SizedBox(
                  width: width ?? 0.8.sw,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text(
                          label == null ? "" : label.tr,
                          style: AppTextStyle.black_14Point5,
                        ),
                      )
                    ],
                  ),
                )
              : Container(),
          Container(
            width: width ?? 0.8.sw,
            decoration: AppContainerStyle.radiusAll8.copyWith(
              color: AppColors.gray100,
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 4, bottom: 4, left: 12, right: 12),
              child: DropdownButton<String>(
                isExpanded: true,
                focusNode: focusNode,
                items: dataList.map((String value) {
                  // print('id of stuff ${value.id}');
                  // FocusScope.of(context).requestFocus(FocusNode());
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value.tr,
                      textAlign: TextAlign.center,
                      style: AppTextStyle.black_14,
                    ),
                  );
                }).toList(),
                underline: SizedBox(
                  width:  0.9.sw,
                  height: 1,
                ),
                hint: Text(selected == null ? hint : '${selected?.tr}',
                    //textAlign: TextAlign.right,
                    style: selected == null ? AppTextStyle.grey_14point5 : AppTextStyle.black_14Point5),
                onChanged: (String? value) {
                  if (nextNode == null) {
                    FocusScope.of(context).requestFocus(nextNode);
                  } else {
                    FocusScope.of(context).unfocus();
                  }
                  changeSelectedItem(value!);
                  print("CXX::${value}");
                },
              ),
            ),
          ),
          error==null?Container(): SizedBox(
            width: width ??  0.8.sw,
            child: Row(
              children: [
                Text(
                  error ?? "",
                  style: AppTextStyle.grey_13.copyWith(color: AppColors.delete),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

// for list of UtilModel only
class DropDownListOfUtils extends StatelessWidget {
  List<UtilsModel> dataList;
  UtilsModel? selected;
  String? label;
  double? width;
  bool isLabelOutside;
  String? hint;
  FocusNode? focusNode;
  FocusNode? nextNode;
  String? error;
  bool filled;

  Function(BuildContext, UtilsModel) changeSelectedItem;

  DropDownListOfUtils({super.key,
    required this.dataList,
    this.selected,
    this.label,
    this.hint,
    this.focusNode,
    required this.changeSelectedItem,
    this.width,
    this.nextNode,
    this.error,
    this.filled = true,
    this.isLabelOutside = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        children: [
          isLabelOutside
              ? SizedBox(
                  width: width ?? 0.8.sw,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text(
                          label == null ? "" : label!.tr,
                          style: AppTextStyle.black_14Point5,
                        ),
                      )
                    ],
                  ),
                )
              : Container(),
          Container(
            width: width ??  0.8.sw,
            decoration: AppContainerStyle.radiusAll8.copyWith(
                color: filled ? AppColors.gray100 : null,
                border: Border.all(width: 1, color: error == null ? AppColors.gray100 : AppColors.delete)),
            child: Padding(
              padding: const EdgeInsets.only(top: 4, bottom: 4, left: 12, right: 12),
              child: DropdownButton<UtilsModel>(
                isExpanded: true,
                focusNode: focusNode,
                items: dataList.map((UtilsModel value) {
                  // print('id of stuff ${value.id}');
                  // FocusScope.of(context).requestFocus(FocusNode());
                  return DropdownMenuItem<UtilsModel>(
                    value: value,
                    child: Text(
                      value.name!,
                      textAlign: TextAlign.center,
                      style: AppTextStyle.black_14,
                    ),
                  );
                }).toList(),
                underline: SizedBox(
                  width:  0.9.sw,
                  height: 1,
                ),
                hint: Text(
                  selected == null ? hint ?? '' : '${selected?.name!}',
                  //textAlign: TextAlign.right,
                  style: selected == null ? AppTextStyle.grey_14point5 : AppTextStyle.black_14Point5,
                  overflow: TextOverflow.ellipsis,
                ),
                onChanged: (UtilsModel? value) {
                  if (nextNode == null) {
                    FocusScope.of(context).requestFocus(nextNode);
                  } else {
                    FocusScope.of(context).unfocus();
                  }

                  changeSelectedItem(context, value!);
                },
              ),
            ),
          ),
          error==null?Container():
          SizedBox(
            width: width ??  0.8.sw,
            child: Row(
              children: [
                Text(
                  error ?? "",
                  style: AppTextStyle.grey_13.copyWith(color: AppColors.delete),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
