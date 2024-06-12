// import 'package:objectbox/objectbox.dart';
import 'package:train_in/objectbox.g.dart';
import 'package:train_in/service/database/models/exercise_model.dart';
import 'package:train_in/service/providers/exercise_provider.dart';

class ExerciseRepository {
  late ExerciseProvider _provider;
  late Store _store;
  String path;

  ExerciseRepository({required provider, required this.path}){
    _provider = provider;
    _store = Store(
      getObjectBoxModel(),
      directory: path
    );
  }

  Future<void> setExercises() async {
    List<dynamic> list = await _provider.getExercises();
    int id = 0;

    for (var exercise in list) {
      _provider.downloadImage(link: exercise['gifUrl']).then(
        (image) {
          print(exercise['gifUrl']);
          final exerc = Exercise(
            id: id,
            name: exercise['name'],
            equipment: exercise['equipment'],
            muscle: exercise['target'],
            instructions: exercise['instructions'].join(' '),
            image: image
          );

          _store.box<Exercise>().put(exerc);
        }
      );
    }

    print('called');
  }

  List<Exercise> getLocalExercises() {
    return _store
        .box<Exercise>()
        .getAll();/* query()
        .watch(triggerImmediately: true)
        .map((value) => value.find()); */
  }
}
