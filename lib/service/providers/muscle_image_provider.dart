import 'package:dio/dio.dart';

class MuscleImageProvider {
  final String _path = 'https://muscle-group-image-generator.p.rapidapi.com/getImage';
  final Dio dio;
  MuscleImageProvider({required this.dio}){
    dio.options.baseUrl = _path;
    // dio.options.headers = 
  }

  getGroupImage() async {
    return ;
  }
}