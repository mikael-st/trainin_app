import 'package:objectbox/objectbox.dart';

@Entity()
class ExerciseModel {
  @Id()
  String id;
  String name;
  String equipament;
  String muscle;
  String instructions;

  ExerciseModel({
    required this.id,
    required this.name,
    required this.equipament,
    required this.muscle,
    required this.instructions
  });
}