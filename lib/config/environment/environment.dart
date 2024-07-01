import 'dart:developer';
import 'package:flutter_dotenv/flutter_dotenv.dart';


class Environment {

  static String environmentFile = '.env';
  static String baseUrlApp = '';
  static String baseUrlKeycloak = '';
  static String clientID = '';
  static String clientSecret= '';



  static Future<void> setEnvironment() async {
    try {
      await dotenv.load(fileName: environmentFile);
      baseUrlApp = dotenv.get("BASE_URL_APP", fallback: baseUrlApp);
      baseUrlKeycloak = dotenv.get("BASE_URL_KEYCLOAK", fallback: baseUrlKeycloak);
      clientID = dotenv.get("CLIENT_ID", fallback: clientID);
      clientSecret = dotenv.get("CLIENT_SECRET", fallback: clientSecret);

      log("Base Url: $baseUrlApp");
    } catch (e) {
      log("Couldn't read env file ${e.toString()}");
    }
  }
}
