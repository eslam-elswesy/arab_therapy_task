import 'package:arab_therapy_task/features/account/presentation/controllers/account_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';




class AccountView extends GetView<AccountController> {
  AccountView({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key

  @override
  Widget build(BuildContext context) {
    
    return  controller.obx(
          (snap) => Column(
            children: [
              Expanded(
                child: Container(
        color: Colors.redAccent,
      ),
              ),
            ],
          ),
    );
  }
}
