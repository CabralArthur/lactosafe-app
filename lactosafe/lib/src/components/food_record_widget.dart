import 'package:LactoSafe/src/controller/Info_food_controllers/food_risk_text_color.dart';
import 'package:LactoSafe/src/model/info_food_model.dart';
import 'package:LactoSafe/src/shared/app_images.dart';
import 'package:LactoSafe/src/shared/app_settings.dart';
import 'package:flutter/material.dart';

import '../shared/app_colors.dart';

class FoodRecord extends StatefulWidget {
  final List<FoodModel> userFoodsRecords;
  const FoodRecord({super.key, required this.userFoodsRecords});

  @override
  State<FoodRecord> createState() => _FoodRecordState();
}

class _FoodRecordState extends State<FoodRecord> {
  @override
  Widget build(BuildContext context) {
    if (widget.userFoodsRecords.isEmpty) {
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
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.userFoodsRecords.length,
                  itemBuilder: (context, index) => buildFoodCard(
                      context: context, food: widget.userFoodsRecords[index]))),
        
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

Widget buildFoodCard(
        {required BuildContext context, required FoodModel food}) =>
    Container(
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
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: InkWell(
              borderRadius: BorderRadius.circular(30),
              onTap: () {
                Navigator.pushNamed(context, '/InfoAlimento', arguments: food);
                
              },
              splashColor: AppColors.shadow,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
        
                    ClipPath(
                clipper: const ShapeBorderClipper(shape: CircleBorder()),
                clipBehavior: Clip.hardEdge,
                child: food.getImageUrl != null
                    ? Image.network(food.getImageUrl as String,
                        width: 130,
                        height: 130,
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
                              color: foodRiskTextColor(risk: food.getLactoseRiskStr as String)),
                                  
                        ),
                        Text(
                          food.getLactoseRiskStr as String,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: foodRiskTextColor(risk: food.getLactoseRiskStr as String),
                        ))
                      ],
                    )
                  ],
                ),
              )),
        ));
