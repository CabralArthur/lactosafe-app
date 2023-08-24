
import 'package:LactoSafe/src/shared/app_colors.dart';
import 'package:flutter/material.dart';

Color foodRiskTextColor({required String risk}){
  switch(risk){
    case 'Inexistente':
      return AppColors.greenShadow;

    case 'Baixo':
      return AppColors.green;

    case 'Medio':
      return AppColors.yellow;

    case 'Alto':
      return AppColors.orange;

    case 'Muito Alto':
      return AppColors.red;

    default:
     return AppColors.grey;
  }
}