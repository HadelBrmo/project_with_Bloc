import 'package:dio/dio.dart';
import 'package:learn_bloc/constant/string.dart';
import '../models/character.dart';

class ApiServices {
  late Dio dio;

  ApiServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    );
    dio = Dio(options);
  }

  Future<Characters> getAllCharacters() async {
    try {
      Response response = await dio.get('character');
      print(response.data.toString());
      return Characters.fromJson(response.data);
    } catch (e) {
      print(e.toString());
      return Characters();
    }
  }
}