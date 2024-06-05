import 'package:dio/dio.dart';
import 'package:train_in/service/providers/exercise_image_provider.dart';

class Utils {
  static final imageProvider = ExerciseImageProvider(dio: Dio());
}