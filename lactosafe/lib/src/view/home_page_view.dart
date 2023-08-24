import 'package:LactoSafe/src/components/food_record_widget.dart';
import 'package:LactoSafe/src/components/custom_text_field.dart';
import 'package:LactoSafe/src/model/info_food_model.dart';
import 'package:LactoSafe/src/shared/app_colors.dart';
import 'package:LactoSafe/src/shared/app_settings.dart';
import 'package:flutter/material.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({super.key});

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  FoodModel foodTest = FoodModel(nome: "Creme de Leite", helpText: "_helpText", chanceLactose: 0, image: null);

  @override
  Widget build(BuildContext Context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(26.0),
        child: SizedBox(
          height: AppSettings.screenHeight,
          child: Column(
            children: [
              //Procure Produtos
              SizedBox(
                width: AppSettings.screenWidth,
                child: Text(
                  'Procure produtos ',
                  style: TextStyle(
                    color: AppColors.grey,
                    fontSize: 24,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w900,
                    letterSpacing: 2.40,
                  ),
                ),
              ),

              SizedBox(
                height: AppSettings.screenHeight / 30,
              ),

              //Barra de Pesquisa

              CustomTextField(
                icon: Icons.search_rounded,
                label: "Pesquisar",
                iconSize: 28.0,
                controller: TextEditingController(),
              ),

              SizedBox(
                height: AppSettings.screenHeight / 20,
              ),

              // Historico de pesquisa
              SizedBox(
                width: AppSettings.screenWidth,
                height: AppSettings.screenHeight / 22,
                child: Text(
                  'Histórico de pesquisa',
                  style: TextStyle(
                    color: AppColors.grey,
                    fontSize: 21,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),

              FoodRecord(food: foodTest)
            ],
          ),
        ),
      ),
    );
  }
}
