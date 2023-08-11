// criar a parte da logica da barrinha de risco colorida com o nome do nivel de risco aqui

import 'package:LactoSafe/src/model/info_food_model.dart';
import 'package:LactoSafe/src/shared/app_colors.dart';
import 'package:flutter/material.dart';

List? riskFood({required double risk}){
    //int risc = int.parse(food.getChanceLactose);
    String riskText;
    Color colorRisk;
    switch(risk) {
      case == 0:
        colorRisk = AppColors.green;
        riskText = "Inexistente";
        return [colorRisk, riskText];
      case == 100 || <=90:
        colorRisk = Colors.red;
        riskText = "Muito Alto";
        return [colorRisk, riskText];
      default:
        colorRisk = AppColors.orange;
        riskText = "Não Identificado";
        return [colorRisk, riskText];
      }
  }