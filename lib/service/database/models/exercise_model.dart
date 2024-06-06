import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class Exercise {
  @Id()
  int id;
  String name;
  String equipament;
  String muscle;
  String instructions;
  Uint8List bitmapImage;

  Exercise({
    required this.id,
    required this.name,
    required this.equipament,
    required this.muscle,
    required this.instructions,
    required this.bitmapImage
  });

  // factory ExerciseModel.create({required Map<String, String> obj, required Uint8List bitmap}){
    // return ExerciseModel(
      // id: int.parse(obj['id']!),
      // name: obj['name'] ?? 'NONE',
      // equipament: obj['equipament'] ?? 'INDEFINIDO',
      // muscle: obj['muscle'] ?? 'INDEFINIDO',
      // instructions: obj['instructions'] ?? 'INDEFINIDO',
      // bitmapImage: bitmap
    // );
  // }
}


// bodyPart: waist,
// equipment: body weight,
// gifUrl: https://v2.exercisedb.io/image/UcvY9fRgNeiV4m,
// id: 0001,
// name: 3/4 sit-up,
// target: abs,
// instructions: [
//   Lie flat on your back with your knees bent and feet flat on the ground.,
//   Place your hands behind your head with your elbows pointing outwards.,
//   Engaging your abs, slowly lift your upper body off the ground, curling forward until your torso is at a 45-degree angle.,
//   Pause for a moment at the top, then slowly lower your upper body back down to the starting position.,
//   Repeat for the desired number of repetitions.
// ]