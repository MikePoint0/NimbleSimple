import 'package:nimble_simple/core/config/config.dart';

class ApiConstants {

  static const String baseUrl="https://api-qa-demo.nimbleandsimple.com/";

  ApiConstants() {
    if (AppConfig.environment == Environment.production) {
      const String baseUrl="https://api-qa-demo.nimbleandsimple.com/";
    }
  }

  static String pharmaDetails = '${baseUrl}pharmacies/info/';
  static String drugList = 'https://s3-us-west-2.amazonaws.com/assets.nimblerx.com/prod/medicationListFromNIH/medicationListFromNIH.txt';

}
