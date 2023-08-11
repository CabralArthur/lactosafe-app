import 'package:LactoSafe/src/components/info_food_widgets/emoji_risk_measuring_item.dart';
import 'package:LactoSafe/src/components/info_food_widgets/point_risk_measuring_itens.dart';
import 'package:LactoSafe/src/model/info_food_model.dart';
import 'package:LactoSafe/src/shared/app_settings.dart';
import 'package:flutter/material.dart';

class RiskMeasuringBar extends StatelessWidget {
  final double foodRisk;
  const RiskMeasuringBar({super.key, required this.foodRisk});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        Container(
          width: AppSettings.screenWidth,
          height: AppSettings.screenHeight / 24,
          decoration: ShapeDecoration(
            gradient: const LinearGradient(
              begin: Alignment(-1.00, -0.00),
              end: Alignment(1, 0),
              colors: [Color(0xFF05FF00), Color(0xFFF9FF00), Color(0xFFDB1212)],
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        pointRiskMeasuringItem(risk: foodRisk),
        emojiRiskMeasuringItem(risk: foodRisk),
      ],
    );
  }
}
