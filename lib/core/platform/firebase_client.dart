import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class IFirebaseClient {
  late final Dio dio;
}

class FirebaseClient implements IFirebaseClient {
  @override
  late final Dio dio;
  FirebaseClient() {
    dio = Dio(BaseOptions(baseUrl: dotenv.env['AUTH_URL_BASE']!));
  }
}
