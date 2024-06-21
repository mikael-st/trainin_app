import 'dart:typed_data';

class ExerciseDTO {
  late int id;
  late String? name;
  late String? instructions;
  late Uint8List? image;
  late String? target;
  late List<String>? auxiliary;

  ExerciseDTO({
    required this.id,
    this.name,
    this.auxiliary,
    this.instructions,
    this.image,
    this.target
  });

  @override
  String toString() {
    return '{ id: $id name: $name target: $target auxialiary: $auxiliary instructions: $instructions image: $image }';
  }
}
