double itemsRiskMeasuringPosition({required double foodRisk}) {
  switch(foodRisk){
    case 0 || 100:
      return 30;
    case > 0 && <= 40 || > 60 && < 100:
     return 5;
    case > 40 && <= 60:
      return 2.4;
    default:
      return 0;
  }

}