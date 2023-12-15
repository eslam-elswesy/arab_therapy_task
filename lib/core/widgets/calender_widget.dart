
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:arab_therapy_task/core/consts/text_styles.dart';
import 'package:arab_therapy_task/core/consts/app_colors.dart';
import 'package:arab_therapy_task/core/consts/input_style.dart';

class DateInputWidget extends StatelessWidget {
  Widget? child;
  FocusNode focusNode;
  FocusNode? nextNode;
  TextEditingController textController;
  String? error;
  Function(DateTime)? callBack;
  DateTime? selectedDate;
  DateTime? firstDate;
  DateTime? lastDate;


  String? hint;
  DateInputWidget(
      {this.child,
      required this.focusNode,
      this.nextNode,
      required this.textController,
      this.error,
      this.callBack,
      this.selectedDate,
      this.hint,
      this.lastDate,
      this.firstDate,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return child ??
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: SizedBox(
            width:  0.8.sw,
            child: Column(
              children: [
                Container(
                  width:   0.8.sw,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text(
                          hint ?? "birthday".tr,
                          style: AppTextStyle.black_14Point5,
                        ),
                      )
                    ],
                  ),
                ),
                TextField(
                  readOnly: true,
                  onTap: () => _selectDate(context),
                  style: AppTextStyle.grey_14.copyWith(color: Colors.black),
                  focusNode: focusNode,
                  controller: textController,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  cursorColor: Colors.grey,
                  decoration: AppInputStyle.textFieldDecoration(
                      hintText: hint ?? "birthdayHint".tr,
                      errorText: error == "" ? null : error,
                      suffixIcon: const Icon(
                        Icons.calendar_today,
                        size: 20,
                        color: Colors.black,
                      )),
                  onSubmitted: (_) {
                    nextNode == null ? FocusScope.of(context).unfocus() : FocusScope.of(context).requestFocus(nextNode);
                  },
                ),
              ],
            ),
          ),
        );
  }

  _selectDate(BuildContext context) async {
    FocusScope.of(context).unfocus();
    DateTime? newSelectedDate = await showDatePicker(
      helpText: "",
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: firstDate ?? DateTime(1950),
      lastDate: lastDate ?? DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: ColorScheme.dark(
              primary: AppColors.primaryColor,
              onPrimary: AppColors.white,
              surface: AppColors.primaryColor,
              onSurface: Colors.black,
            ),
            dialogBackgroundColor: Colors.white,
          ),
          child: child ??
              Container(
                height: 100,
                width: 100,
                color: AppColors.successColor(context),
              ),
        );
      },
    );

    if (newSelectedDate != null) {
      selectedDate = newSelectedDate;
      if (callBack != null) {
        callBack!(selectedDate!);
      }
      if (textController != null) {
        // textController?.text = DateFormat.yMMMd().format(selectedDate!)
        //   ..selection = TextSelection.fromPosition(
        //       TextPosition(offset: textController.text.length, affinity: TextAffinity.upstream));
      }
    }
  }
}
