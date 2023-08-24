double itemsRiskMeasuringPosition({required double foodRisk}) {
  switch(foodRisk){
    case 0 || > 90 && <= 100:
      return 30;
    case > 0 && < 50 || > 70 && <= 90:
     return 5;
    case >= 50 && <= 70:
      return 2.4;
    default:
      return 2.5;
  }

}