import 'package:get/get_connect/connect.dart';

class GetClient extends GetConnect {
  Future getFromUrl(String url) {
    return get(url);
  }
}
