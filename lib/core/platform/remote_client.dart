import 'package:get/get_connect/connect.dart';

class RemoteClient extends GetConnect {
  RemoteClient() {
    httpClient.baseUrl = 'http://192.168.1.7:3000';
    // httpClient.baseUrl = 'http://192.168.1.108:3000';
  }
}
