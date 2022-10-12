import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get_connect/connect.dart';

class RemoteClient extends GetConnect {
  RemoteClient() {
    httpClient.baseUrl = dotenv.env['URL_BASE'];
  }
}
