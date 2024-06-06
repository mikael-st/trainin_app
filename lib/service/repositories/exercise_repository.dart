// import 'package:objectbox/objectbox.dart';
import 'dart:typed_data';
import 'package:train_in/objectbox.g.dart';
import 'package:train_in/service/database/models/exercise_model.dart';
import 'package:train_in/service/providers/exercise_provider.dart';

class ExerciseRepository {
  ExerciseProvider provider;
  late Store _store;
  String path;

  ExerciseRepository({required this.provider, required this.path}){
    _store = Store(
      getObjectBoxModel(),
      directory: path
    );
  }

  Future<void> setExercises() async {
    List<dynamic> list = await provider.getExercises();
    
    list.map(
      (exercise) => Exercise(
        id: int.parse(exercise['id']!),
        name: exercise['name'] ?? 'NONE',
        equipament: exercise['equipament'] ?? 'INDEFINIDO',
        muscle: exercise['muscle'] ?? 'INDEFINIDO',
        instructions: exercise['instructions'] ?? 'INDEFINIDO',
        bitmapImage: _getImage(exercise['gitUrl'])
      )
    );
  }

  Stream<List<Exercise>> getExercises() {
    return _store
        .box<Exercise>()
        .query()
        .watch(triggerImmediately: true)
        .map((value) => value.find());
  }

  Uint8List _getImage(String link) {
    late Uint8List img;
    provider.downloadImage(link: link).then(
      (value) => img = value
    );
    return img;
  }
}
