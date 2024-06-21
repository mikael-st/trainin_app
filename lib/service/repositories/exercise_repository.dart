// import 'package:objectbox/objectbox.dart';
import 'dart:io';
import 'dart:typed_data';

import 'package:path_provider/path_provider.dart';
import 'package:train_in/objectbox.g.dart';
import 'package:train_in/service/database/models/exercise_model.dart';
import 'package:train_in/service/providers/exercise_provider.dart';
import 'package:path/path.dart';

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

  // Future<void> defineImgs() async {
  //   final dir = await getTemporaryDirectory();
  //   print(dir.path);

  //   final resp = await _provider.getExercises();
  //   Map<String, dynamic> e = resp[0];

  //   for (var e in resp) {
  //     final path = join( dir.path, 'images', '${e['gifUrl']!}.gif' );
      
  //     await _provider.download(
  //       link: e['gifUrl']!,
  //       path: path,
  //     );

  //     final image = ImageModel(
  //       bytes: await imageToUint8List(path)
  //     );
  //     _store.box<ImageModel>().put(image);
  //   }
  // }

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
        instructions: exercise['instructions'].join(' '),
        image: image
      );
      
      _store.box<Exercise>().put(exerc);
    }
    
    print('called');
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
    return _store
        .box<Exercise>()
        .query()
        .watch(triggerImmediately: true)
        .map((value) => value.find());
  }

  // Stream<List<ImageModel>> getImages() {
  //   return _store
  //           .box<ImageModel>()
  //           .query()
  //           .watch(triggerImmediately: true)
  //           .map((value) => value.find());
  // }
}
