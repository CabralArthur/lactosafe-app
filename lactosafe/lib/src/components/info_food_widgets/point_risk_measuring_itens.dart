import 'package:LactoSafe/src/controller/Info_food_controllers/risk_measuring_items_position_controller.dart';
import 'package:LactoSafe/src/model/info_food_model.dart';
import 'package:LactoSafe/src/shared/app_settings.dart';
import 'package:flutter/material.dart';

import '../../shared/app_colors.dart';

Widget pointRiskMeasuringItem({required double risk}) {
  //double risk = double.parse(food.getChanceLactose);
  if (risk >= 80) {
    return Positioned(
      left: AppSettings.screenWidth / itemsRiskMeasuringPosition(foodRisk: risk),
      child: Container(
        width: AppSettings.screenWidth / 30,
        height: AppSettings.screenHeight / 24,
        decoration: BoxDecoration(
            color: AppColors.grey,
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30))),
      ),
    );
  } else {
    return Positioned(
      right: AppSettings.screenWidth / itemsRiskMeasuringPosition(foodRisk: risk),
      child: Container(
        width: AppSettings.screenWidth / 30,
        height: AppSettings.screenHeight / 24,
        decoration: BoxDecoration(
            color: AppColors.grey,
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30))),
      ),
    );
  }
}
