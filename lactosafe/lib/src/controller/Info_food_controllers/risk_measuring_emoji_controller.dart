import 'package:LactoSafe/src/shared/app_images.dart';

String riskMeasuringEmoji({required double foodRisk}) {
  switch (foodRisk) {
    case 0:
      return AppImages.smileEmoji;
    case > 0 && <= 40:
      return AppImages.doubtEmoji;
    case > 40 && <= 60:
      return AppImages.medianEmoji;

    case > 60 && < 100:
      return AppImages.surprisedEmoji;
    case 100:
      return AppImages.sadEmoji;
    default:
      return AppImages.doubtEmoji;
  }
}
