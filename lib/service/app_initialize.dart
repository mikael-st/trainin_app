import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:train_in/service/database/models/exercise_model.dart';
import 'package:train_in/service/providers/exercise_provider.dart';
import 'package:train_in/service/repositories/exercise_repository.dart';
import 'package:path/path.dart';

class ApplicationInitialize {
  Future<Stream<List<Exercise>>> init() async {
    final dir = await getApplicationDocumentsDirectory();
    
    final repository = ExerciseRepository(provider: ExerciseProvider(dio: Dio()), path: join(dir.path, 'localdata'));
    final list = repository.getLocalExercises();

    // if (list.isEmpty) {
      await repository.define();
    // }

    return list;
  }
}