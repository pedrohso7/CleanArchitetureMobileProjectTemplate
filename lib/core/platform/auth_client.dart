import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get_connect/connect.dart';

class AuthClient extends GetConnect {
  AuthClient() {
    httpClient.baseUrl = dotenv.env['AUTH_URL_BASE'];
  }
}
