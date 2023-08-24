import 'package:LactoSafe/src/components/photo_widget.dart';
import 'package:LactoSafe/src/controller/card_food_risc_widget_controller.dart';
import 'package:LactoSafe/src/model/info_food_model.dart';
import 'package:LactoSafe/src/repositories/food_recognation_repository.dart';
import 'package:LactoSafe/src/shared/app_images.dart';
import 'package:LactoSafe/src/shared/app_settings.dart';
import 'package:flutter/material.dart';

import '../shared/app_colors.dart';

class FoodRecord extends StatefulWidget {
  final FoodModel food;
  const FoodRecord({super.key, required this.food});

  @override
  State<FoodRecord> createState() => _FoodRecordState();
}

class _FoodRecordState extends State<FoodRecord> {
  @override
  Widget build(BuildContext context) {
    if (FoodRecognizedRepository.repository.isEmpty) { //Adicionei isso para teste, mas acredito que nao deva ser acessado assim
      return Stack(
        children: [
          Container(
            width: AppSettings.screenWidth,
            height: AppSettings.screenHeight / 2,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AppImages.welcome), fit: BoxFit.cover)),
          ),
          Container(
            width: AppSettings.screenWidth,
            height: AppSettings.screenHeight / 5.5,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              shadows: const [
                BoxShadow(
                  color: Color(0x0C000000),
                  blurRadius: 30,
                  offset: Offset(0, 15),
                  spreadRadius: 20,
                )
              ],
            ),
            child: const Padding(
              padding: EdgeInsets.all(30.0),
              child: Text(
              'A intolerância a lactose não define quem você é. Não deixe ela te impedir de desfrutar das coisas que ama.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0x991E1E1E),
                fontSize: 18,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
              ),
                      ),
            ),
          )
        ],
      );
      
    } else {
      return Column(
        children: [
          SizedBox(
            height: AppSettings.screenHeight / 14,
            child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    buildFilter('MUITO ALTO'),
                    buildFilter('ALTO'),
                    buildFilter('MÉDIO'),
                    buildFilter('BAIXO'),
                    buildFilter('INEXISTENTE'),
                  ],
                )),
          ),
          SizedBox(
            height: AppSettings.screenHeight / 3 + 20,
            child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    buildFoodCard(food: widget.food),
                    buildFoodCard(food: widget.food),
                    buildFoodCard(food: widget.food),
                  ],
                )),
          ),
        ],
      );
    }
  }
}

Widget buildFilter(String filterName) => Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.all(7),
      width: AppSettings.screenWidth / 3,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(30), boxShadow: [
        BoxShadow(
            color: AppColors.shadow,
            blurRadius: 10,
            offset: Offset.fromDirection(-2, -5),
            spreadRadius: 0.1,
            blurStyle: BlurStyle.normal)
      ]),
      child: Card(
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: InkWell(
            borderRadius: BorderRadius.circular(30),
            onTap: () {
              debugPrint('Card tapped.');
            },
            splashColor: AppColors.shadow,
            child: Center(child: Text(filterName)),
          )),
    );

Widget buildFoodCard({required FoodModel food}) => Container(
    alignment: Alignment.topCenter,
    margin: const EdgeInsets.all(12),
    width: AppSettings.screenWidth / 2 + 40,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: AppColors.shadow,
              blurRadius: 10,
              offset: Offset.fromDirection(-2, -5),
              spreadRadius: 0.1,
              blurStyle: BlurStyle.normal)
        ]),
    child: Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: InkWell(
          borderRadius: BorderRadius.circular(30),
          onTap: () {
            debugPrint('Card tapped.');
          },
          splashColor: AppColors.shadow,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                PhotoWidget(
                  picture: AppImages.cremeDeLeite,
                  height: 130,
                  width: 130,
                ),
                Text(
                  food.getFoodName,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: AppColors.grey),
                ),
                Column(
                  children: [
                    Container(
                      width: AppSettings.screenWidth / 4,
                      height: 28,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: riskFood(risk: food.getChanceLactose)?.first),
                    ),
                    Text(
                      riskFood(risk: food.getChanceLactose)?.last,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: riskFood(risk: food.getChanceLactose)?.first),
                    )
                  ],
                )
              ],
            ),
          )),
    ));