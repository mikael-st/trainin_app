import 'package:dio/dio.dart';

class ExerciseImageProvider {
  final String path = 'https://exercisedb.p.rapidapi.com/exercises';
  final Dio dio;
  ExerciseImageProvider({required this.dio});


}