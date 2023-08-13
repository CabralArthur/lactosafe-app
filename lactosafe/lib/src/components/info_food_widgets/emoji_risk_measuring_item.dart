import 'package:LactoSafe/src/controller/Info_food_controllers/risk_measuring_emoji_controller.dart';
import 'package:LactoSafe/src/controller/Info_food_controllers/risk_measuring_items_position_controller.dart';
import 'package:LactoSafe/src/model/info_food_model.dart';
import 'package:LactoSafe/src/shared/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget emojiRiskMeasuringItem({required double risk}) {
 //double risk = double.parse(food.getChanceLactose);
 
  if (risk <= 70) {
    return Positioned(
        top: -40,
        left: AppSettings.screenWidth / itemsRiskMeasuringPosition(foodRisk: risk) - 12,
        child: SvgPicture.asset(riskMeasuringEmoji(foodRisk: risk)));
  } else {
    return Positioned(
        top: -40,
        right: AppSettings.screenWidth / itemsRiskMeasuringPosition(foodRisk: risk) - 12,
        child: SvgPicture.asset(riskMeasuringEmoji(foodRisk: risk)));
  }
}
