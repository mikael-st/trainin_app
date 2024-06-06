import 'package:dio/dio.dart';
import 'package:train_in/service/providers/exercise_provider.dart';

class Utils {
  static final imageProvider = ExerciseProvider(dio: Dio());
}