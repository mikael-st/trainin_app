import 'package:objectbox/objectbox.dart';
import 'package:train_in/service/dto/exercise.dart';

@Entity()
class TrainingModel {
  @Id()
  String id;
  String name;
  List<int> days;
  List<Exercise> exercises;

  TrainingModel({required this.id, required this.name, required this.days, required this.exercises});
}