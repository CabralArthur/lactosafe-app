import 'dart:io';
import 'package:LactoSafe/src/components/info_food_widgets/risk_measuring_bar.dart';
import 'package:LactoSafe/src/controller/Info_food_controllers/info_food_controller.dart';
import 'package:LactoSafe/src/model/info_food_model.dart';
import 'package:LactoSafe/src/shared/app_colors.dart';
import 'package:LactoSafe/src/shared/app_settings.dart';
import 'package:flutter/material.dart';

class InfoFoodPage extends StatefulWidget {
  const InfoFoodPage({super.key});
  static const routeName = '/InfoAlimento';

  @override
  State<InfoFoodPage> createState() => _InfoFoodPageState();
}

class _InfoFoodPageState extends State<InfoFoodPage> {
  late Future _dataFoodInformation;
  late final File? _foodImage = Foods[0].getImage;

  @override
  void initState() {
    super.initState();
    _dataFoodInformation = setFoodInformation(_foodImage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.popAndPushNamed(context, '/home');
          },
          icon: const Icon(Icons.arrow_back_rounded),
          color: AppColors.orange,
          iconSize: 40.0,
          alignment: Alignment.topLeft,
        ),
      ),
      body: FutureBuilder(
        future: _dataFoodInformation,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return buildFoodInformation(food: Foods[0]);
          }
        },
      ),
    );
  }

  Widget buildFoodInformation({required InfoFood food}) {
    File? foodImage = food.getImage;
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
                  child: foodImage != null
                      ? Image.file(File(foodImage.path),
                          width: 284, height: 267.67, fit: BoxFit.cover)
                      : const Text("Erro ao exibir imagem"),
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
              style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w200),
            ),

            
          ],
        ),
      ),
    );
  }
}
