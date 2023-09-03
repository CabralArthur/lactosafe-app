import 'package:LactoSafe/src/shared/app_images.dart';

String riskMeasuringEmoji({required double foodRisk}) {
  switch (foodRisk) {
    case 0:
      return AppImages.smileEmoji;
    case > 0 && < 25:
      return AppImages.medianEmoji;
    case >= 25 && <= 50:
      return AppImages.doubtEmoji;

    case > 50 && <= 75:
      return AppImages.surprisedEmoji;
    case > 75 && <= 100:
      return AppImages.sadEmoji;

    default:
      return AppImages.doubtIcon;
  }
}
