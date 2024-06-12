import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:train_in/service/config/enviroments.dart';

class ExerciseProvider {
  final String path = 'https://exercisedb.p.rapidapi.com/';
  final Dio dio;

  ExerciseProvider({required this.dio}) {
    dio.options.baseUrl = path;
    dio.options.headers['x-rapidapi-key'] = Env.key;
    dio.options.headers['x-rapidapi-host'] = Env.host;

    // print('key: ${Env.key}\nhost: ${Env.host}');
  }

  Future<Uint8List> downloadImage({required String link}) async {
    try {
      final response = await dio.get(
        link,
        options: Options(
          responseType: ResponseType.bytes
        )
      );
      return response.data;
    } catch (err) {
      throw Exception(err);
    }
  }

  Future<List<dynamic>> getExercises() async {
    try {
      final response = await dio.get('/exercises', queryParameters: {'limit': '0', 'offset': '0'});
      return response.data;
    } catch (err) {
      throw Exception(err);
    }
  }

  Future<dynamic> status() async {
    try {
      dynamic response;

      await dio.get('/status').then(
          (value) => response = value.data);

      return response;
    } catch (err) {
      throw Exception(err);
    }
  }
}