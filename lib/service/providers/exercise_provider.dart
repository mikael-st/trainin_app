import 'package:dio/dio.dart';
import 'package:train_in/service/config/env.dart';

class ExerciseProvider {
  final String path = 'https://exercisedb.p.rapidapi.com/';
  final Dio dio;

  ExerciseProvider({required this.dio}) {
    dio.options.baseUrl = path;
    dio.options.headers['x-rapidapi-key'] = Env.key;
    dio.options.headers['x-rapidapi-host'] = Env.host;

    // print('key: ${Env.key}\nhost: ${Env.host}');
  }

  Future<void> download({required String link, required String path}) async {
    try {
      await dio.download(
        link,
        path,
      );
    } catch (err) {
      throw Exception(err);
    }
  }

  Future<List<dynamic>> getExercises() async {
    try {
      final response = await dio.get('/exercises', queryParameters: {'limit': '10', 'offset': '0'});
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