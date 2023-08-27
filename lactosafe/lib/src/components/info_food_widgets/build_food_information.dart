import 'package:LactoSafe/src/components/info_food_widgets/risk_measuring_bar.dart';
import 'package:LactoSafe/src/controller/Info_food_controllers/food_risk_text_color.dart';
import 'package:flutter/material.dart';
import '../../model/info_food_model.dart';
import '../../shared/app_colors.dart';
import '../../shared/app_settings.dart';

Widget buildFoodInformation({required FoodModel food}) {
  return Container(
    padding: const EdgeInsets.all(30.0),
    alignment: Alignment.topCenter,
    child: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            width: 262,
            height: 100,
            child: Text(
              food.getFoodName,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.grey,
                fontSize: 36,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          Stack(alignment: Alignment.center, children: <Widget>[
            SizedBox(
              width: AppSettings.screenWidth,
              height: AppSettings.screenHeight / 3,
              child: ClipPath(
                clipper: const ShapeBorderClipper(shape: CircleBorder()),
                clipBehavior: Clip.hardEdge,
                child: food.getImageUrl != null
                    ? Image.network(food.getImageUrl as String,
                        width: AppSettings.screenWidth / 4,
                        height: AppSettings.screenHeight / 2,
                        fit: BoxFit.cover)
                    : Container(
                        width: AppSettings.screenWidth / 4,
                        height: AppSettings.screenHeight / 2,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: AppColors.grey, shape: BoxShape.circle),
                        child: const Text(
                          "Erro ao carregar imagem",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
              ),
            ),
            Stack(
              alignment: Alignment.topRight,
              children: <Widget>[
                Column(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: FloatingActionButton(
                        heroTag: 'Favorite',
                        backgroundColor: AppColors.orange,
                        onPressed: () {},
                        child: const Icon(Icons.favorite),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: FloatingActionButton(
                        heroTag: 'MoreInformation',
                        backgroundColor: AppColors.orange,
                        onPressed: () {},
                        child: const Icon(Icons.question_mark_sharp),
                      ),
                    )
                  ],
                )
              ],
            )
          ]),
          SizedBox(
            height: AppSettings.screenHeight / 15,
          ),
          RiskMeasuringBar(foodRisk: food.getLactoseRisk as double),
          SizedBox(
            height: AppSettings.screenHeight / 30,
          ),
          SizedBox(
            child: Text.rich(TextSpan(children: [TextSpan(
                            text: 'Risco de conter lactose: ',
                            style: TextStyle(
                              color: AppColors.grey,
                              fontSize: 18,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w900,
                            ),
                          ), TextSpan(
                            text: '${food.getLactoseRiskStr}',
                            style: TextStyle(
                              color: foodRiskTextColor(risk: food.getLactoseRiskStr as String),
                              fontSize: 18,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w900,
                            ),
                          ),])),
          ),
          SizedBox(height: AppSettings.screenHeight/30,),
          Text(food.getHelpText as String, style: TextStyle(
              color: AppColors.grey,
              fontSize: 16,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
            ),),
          
        ],
      ),
    ),
  );
}
