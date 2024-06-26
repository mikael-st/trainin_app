import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:train_in/service/database/models/exercise_model.dart';
import 'package:train_in/service/providers/exercise_provider.dart';
import 'package:train_in/service/repositories/exercise_repository.dart';
import 'package:path/path.dart';

class ApplicationInitialize {
  late Stream<List<Exercise>> _exercises;

  Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    
    // final repository = ExerciseRepository(provider: ExerciseProvider(dio: Dio()), path: join(dir.path, 'localdata'));
    // _exercises = repository.getLocalExercises();

    // if (isEmpty) {
      // await repository.define();
    // }
  }

  

  get exercises => _exercises;
}