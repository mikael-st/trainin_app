// import 'package:objectbox/objectbox.dart';
import 'dart:io';
import 'dart:typed_data';

import 'package:path_provider/path_provider.dart';
import 'package:train_in/objectbox.g.dart';
import 'package:train_in/service/database/models/exercise_model.dart';
import 'package:train_in/service/database/models/training_model.dart';
import 'package:train_in/service/providers/exercise_provider.dart';
import 'package:path/path.dart';

class ExerciseRepository {
  late ExerciseProvider _provider;
  late Box<Exercise> _box;

  ExerciseRepository({required ExerciseProvider provider, required Box<Exercise> box}){
    _provider = provider;
    _box = box;
  }

  Future<void> define() async {
    List<dynamic> list = await _provider.getExercises();

    final dir = await getTemporaryDirectory();
    String path = join(dir.path, 'images');

    for (var exercise in list) {

      await _downloadImage(
        link: exercise['gifUrl']!,
        path: join (
          path,
          '${exercise['id']!}'
        )
      );

      final image = await imageToUint8List( join( path, '${exercise['id']!}'));

      final exerc = Exercise(
        id: 0,
        name: exercise['name'],
        equipment: exercise['equipment'],
        muscle: exercise['target'],
        instructions: jsonToStringArray(exercise['instructions']),
        image: image
      );

      _box.put(exerc);
    }
    
    print('called');
  }

  bool addToTraining({required int exerciseId, required Training training}) {
    final exercise = _box.get(exerciseId);

    if (exercise != null) {
      exercise.trainings.add(training);
      _box.put(exercise, mode: PutMode.update);
      return true;
    }

    return false;
  } 

  List<String> jsonToStringArray(List<dynamic> list) {
    final stringList = list.cast<String>().toList();

    return stringList;
  }

  Future _downloadImage({required String path, required String link}) async {
    await _provider.download(
      link: link,
      path: path
    );
  }

  Future<Uint8List> imageToUint8List(String path) async {
    File gif = File(path);

    if (await gif.exists()) {
      Uint8List bytes = await gif.readAsBytes();
      await gif.delete();
      return bytes; 
    }
    return Uint8List(0);
  }

  Stream<List<Exercise>> getLocalExercises() {
    return _box
        .query()
        .watch(triggerImmediately: true)
        .map((value) => value.find());
  }

  Exercise? find({required int id}) {
    return _box.get(id);
  }
}
