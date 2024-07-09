import 'package:train_in/objectbox.g.dart';
import 'package:train_in/service/database/models/exercise_model.dart';
import 'package:train_in/service/database/models/training_model.dart';

class TrainingRepository {
  late Box<Training> _box;
  TrainingRepository({required Box<Training> box}){
    _box = box;
  }

  int create({
    required String name,
    required List<int> days,
  }) {
    final training = Training(name: name, days: days);

    _box.put(training);
    return training.id;
  }

  void addExercise({required int id, required Exercise exercise}) {
    final training = _box.get(id)!;

    training.exercises.add(exercise);
    
    _box.put(training, mode: PutMode.update);
  }

  bool done({required int id}) {
    final training = _box.get(id);

    if (training != null) {
      training.done = true;
      training.donedAt = DateTime.now();

      _box.put(training, mode: PutMode.update);
      return true;
    }

    return false;
  }

  bool haveTrainings() {
    return _box.getAll().isEmpty;
  }

  Stream<List<Training>> getAll() {
    return _box
      .query()
      .watch(triggerImmediately: true)
      .map((v) => v.find());
  }

  Stream<Training> watch(int id) {
    return _box.query(Training_.id.equals(id)).watch(triggerImmediately: true).cast<Training>();
  }

  Training? find(int id) {
    return _box.get(id);
  }

  Stream<List<Training>> getDoned() {
    return _box
      .query(Training_.done.equals(true))
      .watch(triggerImmediately: true)
      .map((v) => v.find());
  }
}