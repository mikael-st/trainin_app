import 'dart:typed_data';

class ExerciseDTO {
  late int id;
  late String? name;
  late String? description;
  late Uint8List? image;
  late String? target;
  late List<String>? auxiliary;

  ExerciseDTO({
    required this.id,
    this.name,
    this.auxiliary,
    this.description,
    this.image,
    this.target
  });
}
