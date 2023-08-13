import 'package:LactoSafe/src/shared/app_images.dart';

String riskMeasuringEmoji({required double foodRisk}) {
  switch (foodRisk) {
    case 0:
      return AppImages.smileEmoji;
    case > 0 && < 50:
      return AppImages.medianEmoji;
    case >= 50 && <= 70:
      return AppImages.doubtEmoji;

    case > 70 && <= 90:
      return AppImages.surprisedEmoji;
    case > 90 && <= 100:
      return AppImages.sadEmoji;

    default:
      return AppImages.doubtIcon;
  }
}
