import 'package:dio/dio.dart';

class ExerciseImageProvider {
  final String path = 'https://exercisedb.p.rapidapi.com/';
  final Dio dio;

  ExerciseImageProvider({required this.dio}) {
    dio.options.baseUrl = path;
    dio.options.headers['x-rapidapi-key'] = 'ae60c37e15msh4aac83d595445f8p12d115jsn7ae58518e2d2';
    dio.options.headers['x-rapidapi-host'] = 'exercisedb.p.rapidapi.com';
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

/* import 'package:dio/dio.dart';

class LasfFMService {
  late final Dio _dio;
  final String key = const String.fromEnvironment('KEY');
  late final String session;

  LastFMService() {
    _dio = Dio();
    _dio.options.baseUrl = 'http://ws.audioscrobbler.com/2.0';
    _dio.options.headers['User-Agent'] = 'Zune - mobile mp3 player app';
    _dio.options.queryParameters = {'format': 'json', 'api_key': key};
  }

  Future<dynamic> searchArtistsBio(String artist) async {
    try {
      final response = await _dio.get('/', queryParameters: {
        'method': 'artist.getinfo',
        'artist': artist,
      });
      return response.data['artist']['bio']['summary'];
    } catch (e) {
      throw Exception(e);
    }
  }
}
 */