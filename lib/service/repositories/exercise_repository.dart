import 'package:train_in/service/providers/exercise_provider.dart';

class ExerciseRepository {
  ExerciseProvider provider;

  ExerciseRepository({required this.provider});

  Future<List<dynamic>> setExercises() async {
    List<dynamic> list = await provider.getExercises();
    return list;
  }
}
