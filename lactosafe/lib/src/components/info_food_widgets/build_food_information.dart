import 'dart:io';
import 'package:flutter/material.dart';
import '../../model/info_food_model.dart';
import '../../shared/app_colors.dart';
import '../../shared/app_settings.dart';
import 'risk_measuring_bar.dart';

Widget buildFoodInformation(
      {required FoodModel food}) {
    
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
                  child: food.getImage != null
                      ? Image.file(File(food.getImage!.path),
                          width: 284, height: 267.67, fit: BoxFit.cover)
                      : Container(
                          alignment: Alignment.center,
                          width: AppSettings.screenWidth,
                          height: AppSettings.screenHeight / 3,
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
            RiskMeasuringBar(foodRisk: food.getChanceLactose),
            SizedBox(
              height: AppSettings.screenHeight / 30,
            ),
            Text(
              "${food.getChanceLactose} % chanche de ser ${food.getFoodName}",
              style:
                  const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w200),
            ),
          ],
        ),
      ),
    );
  }