import 'package:LactoSafe/src/controller/Info_food_controllers/food_risk_text_color.dart';
import 'package:LactoSafe/src/model/info_food_model.dart';
import 'package:LactoSafe/src/shared/app_images.dart';
import 'package:LactoSafe/src/shared/app_settings.dart';
import 'package:flutter/material.dart';

import '../shared/app_colors.dart';

// ignore: must_be_immutable
class FoodRecord extends StatefulWidget {
  final List<FoodModel> userFoodsRecords;
  List<FoodModel> filter;
  FoodRecord({super.key, required this.userFoodsRecords, required this.filter});

  @override
  State<FoodRecord> createState() => _FoodRecordState();
}

class _FoodRecordState extends State<FoodRecord> {
  bool filterMuitoAlto = false;
  bool filterAlto = false;
  bool filterMedio = false;
  bool filterBaixo = false;
  bool filterInexistente = false;

  void filterColor({required String filterName}) {
    switch (filterName) {
      case 'Muito Alto':
        if (filterMuitoAlto == true) {
          filterMuitoAlto = false;
        } else {
          filterMuitoAlto = true;
          filterAlto = false;
          filterMedio = false;
          filterBaixo = false;
          filterInexistente = false;
        }

      case 'Alto':
        if (filterAlto == true) {
          filterAlto = false;
        } else {
          filterAlto = true;
          filterMuitoAlto = false;
          filterMedio = false;
          filterBaixo = false;
          filterInexistente = false;
        }
      case 'Medio':
        if (filterMedio == true) {
          filterMedio = false;
        } else {
          filterMedio = true;
          filterMuitoAlto = false;
          filterAlto = false;
          filterBaixo = false;
          filterInexistente = false;
        }
      case 'Baixo':
        if (filterBaixo == true) {
          filterBaixo = false;
        } else {
          filterBaixo = true;
          filterMuitoAlto = false;
          filterAlto = false;
          filterMedio = false;
          filterInexistente = false;
        }
      case 'Inexistente':
        if (filterInexistente == true) {
          filterInexistente = false;
        } else {
          filterInexistente = true;
          filterMuitoAlto = false;
          filterAlto = false;
          filterMedio = false;
          filterBaixo = false;
        }
    }
  }

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
                    //FILTER MUILTO ALTO
                    ElevatedButton(
                      onPressed: () {
                        List<FoodModel> riskFoods = [];
                        setState(() {
                          filterColor(filterName: 'Muito Alto');
                          if (filterMuitoAlto == true) {
                            for (int i = 0;
                                i < widget.userFoodsRecords.length;
                                i++) {
                              if (widget
                                      .userFoodsRecords[i].getLactoseRiskStr ==
                                  "Muito Alto") {
                                riskFoods.add(widget.userFoodsRecords[i]);
                              }
                            }
                          } else {
                            riskFoods = widget.userFoodsRecords;
                          }
                          widget.filter = riskFoods;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          shadowColor: AppColors.shadow,
                          elevation: 8.0,
                          shape: const StadiumBorder(),
                          minimumSize: Size(AppSettings.screenWidth / 3,
                              AppSettings.screenWidth / 10),
                          backgroundColor: filterMuitoAlto
                              ? AppColors.orange
                              : Colors.white),
                      child: Text(
                        "MUITO ALTO",
                        style: TextStyle(
                            color: filterMuitoAlto
                                ? Colors.white
                                : AppColors.grey),
                      ),
                    ),

                    const SizedBox(width: 10,),

                    //FILTER ALTO
                    ElevatedButton(
                      onPressed: () {
                        List<FoodModel> riskFoods = [];
                        setState(() {
                          filterColor(filterName: 'Alto');
                          if (filterAlto == true) {
                            for (int i = 0;
                                i < widget.userFoodsRecords.length;
                                i++) {
                              if (widget
                                      .userFoodsRecords[i].getLactoseRiskStr ==
                                  "Alto") {
                                riskFoods.add(widget.userFoodsRecords[i]);
                              }
                            }
                          } else {
                            riskFoods = widget.userFoodsRecords;
                          }
                          widget.filter = riskFoods;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          shadowColor: AppColors.shadow,
                          elevation: 8.0,
                          shape: const StadiumBorder(),
                          minimumSize: Size(AppSettings.screenWidth / 3,
                              AppSettings.screenWidth / 10),
                          backgroundColor: filterAlto
                              ? AppColors.orange
                              : Colors.white),
                      child: Text(
                        "ALTO",
                        style: TextStyle(
                            color: filterAlto
                                ? Colors.white
                                : AppColors.grey),
                      ),
                    ),

                    const SizedBox(width: 10,),

                    //FILTER MEDIO
                    ElevatedButton(
                      onPressed: () {
                        List<FoodModel> riskFoods = [];

                        setState(() {
                          filterColor(filterName: 'Medio');
                          if (filterMedio == true) {
                            for (int i = 0;
                                i < widget.userFoodsRecords.length;
                                i++) {
                              if (widget
                                      .userFoodsRecords[i].getLactoseRiskStr ==
                                  "Medio") {
                                riskFoods.add(widget.userFoodsRecords[i]);
                              }
                            }
                          } else {
                            riskFoods = widget.userFoodsRecords;
                          }
                          widget.filter = riskFoods;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          shadowColor: AppColors.shadow,
                          elevation: 8.0,
                          shape: const StadiumBorder(),
                          minimumSize: Size(AppSettings.screenWidth / 3,
                              AppSettings.screenWidth / 10),
                          backgroundColor:
                              filterMedio ? AppColors.orange : Colors.white),
                      child: Text(
                        "MEDIO",
                        style: TextStyle(
                            color: filterMedio ? Colors.white : AppColors.grey),
                      ),
                    ),

                    const SizedBox(width: 10,),

                    //FILTER BAIXO

                    ElevatedButton(
                      onPressed: () {
                        List<FoodModel> riskFoods = [];
                        setState(() {
                          filterColor(filterName: 'Baixo');
                          if (filterBaixo == true) {
                            for (int i = 0;
                                i < widget.userFoodsRecords.length;
                                i++) {
                              if (widget
                                      .userFoodsRecords[i].getLactoseRiskStr ==
                                  "Baixo") {
                                riskFoods.add(widget.userFoodsRecords[i]);
                              }
                            }
                          } else {
                            riskFoods = widget.userFoodsRecords;
                          }
                          widget.filter = riskFoods;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          shadowColor: AppColors.shadow,
                          elevation: 8.0,
                          shape: const StadiumBorder(),
                          minimumSize: Size(AppSettings.screenWidth / 3,
                              AppSettings.screenWidth / 10),
                          backgroundColor: filterBaixo
                              ? AppColors.orange
                              : Colors.white),
                      child: Text(
                        "BAIXO",
                        style: TextStyle(
                            color: filterBaixo
                                ? Colors.white
                                : AppColors.grey),
                      ),
                    ),

                    const SizedBox(width: 10,),

                    ElevatedButton(
                      onPressed: () {
                        List<FoodModel> riskFoods = [];
                        setState(() {
                          filterColor(filterName: 'Inexistente');
                          if (filterInexistente == true) {
                            for (int i = 0;
                                i < widget.userFoodsRecords.length;
                                i++) {
                                  
                              if (widget
                                      .userFoodsRecords[i].getLactoseRiskStr ==
                                  "Inexistente") {
                                riskFoods.add(widget.userFoodsRecords[i]);
                              }
                            }
                          } else {
                            riskFoods = widget.userFoodsRecords;
                          }
                          widget.filter = riskFoods;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          shadowColor: AppColors.shadow,
                          elevation: 8.0,
                          shape: const StadiumBorder(),
                          minimumSize: Size(AppSettings.screenWidth / 3,
                              AppSettings.screenWidth / 10),
                          backgroundColor: filterInexistente
                              ? AppColors.orange
                              : Colors.white),
                      child: Text(
                        "INEXISTENTE",
                        style: TextStyle(
                            color: filterInexistente
                                ? Colors.white
                                : AppColors.grey),
                      ),
                    ),
                  ],
                )),
          ),
          SizedBox(
              height: AppSettings.screenHeight / 3 + 20,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.filter.length,
                  itemBuilder: (context, index) => buildFoodCard(
                      context: context, food: widget.filter[index]))),
        ],
      );
    }
  }
}


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
                              width: 130, height: 130, fit: BoxFit.cover)
                          : Container(
                              width: AppSettings.screenWidth / 4,
                              height: AppSettings.screenHeight / 2,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: AppColors.grey,
                                  shape: BoxShape.circle),
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
                              color: foodRiskTextColor(
                                  risk: food.getLactoseRiskStr as String)),
                        ),
                        Text(food.getLactoseRiskStr as String,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: foodRiskTextColor(
                                  risk: food.getLactoseRiskStr as String),
                            ))
                      ],
                    )
                  ],
                ),
              )),
        ));
