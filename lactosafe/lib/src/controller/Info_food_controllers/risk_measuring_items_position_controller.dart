double itemsRiskMeasuringPosition({required double foodRisk}) {
  switch(foodRisk){
    case 0 || > 75 && <= 100:
      return 10;
    case > 0 && <= 25 || > 50 && <= 75:
     return 4.5;
    case > 25 && <= 50:
      return 2.5;
    default:
      return 2.5;
  }

}