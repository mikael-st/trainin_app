import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:train_in/service/providers/exercise_provider.dart';
import 'package:train_in/service/repositories/exercise_repository.dart';
import 'package:path/path.dart';

final class Utils {
  static final _provider = ExerciseProvider(dio: Dio());

  static ExerciseRepository storage = ExerciseRepository(provider: _provider, path: applicationDir);

  static get applicationDir async {
    late String path;
    getApplicationCacheDirectory().then(
      (dir) => path = join(dir.path, 'localData')
    );
    return path;
  }

  static get status async => await _provider.status();
}