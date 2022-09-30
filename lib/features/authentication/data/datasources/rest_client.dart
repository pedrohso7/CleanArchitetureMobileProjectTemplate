import 'package:get/get_connect/connect.dart';

class RestClient extends GetConnect {
  RestClient() {
    httpClient.baseUrl = 'http://192.168.1.7:3000';
  }
}
