import 'package:objectbox/objectbox.dart';
import 'package:train_in/service/database/models/exercise_model.dart';

@Entity()
class Training {
  @Id()
  int id;
  String name;
  List<int> days;

  bool done;
  DateTime? donedAt;

  final exercises = ToMany<Exercise>();

  Training({
    this.id = 0,
    required this.name,
    required this.days,
    this.done = false
  });
}