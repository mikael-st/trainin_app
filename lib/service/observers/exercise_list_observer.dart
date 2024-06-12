import 'package:flutter/material.dart';

interface class ExerciseListObserver {
  external update(List<Map<String, String>> list, { required bool scrolling }); 
}

class ExerciseList implements ExerciseListObserver{
  List<Map<String, String>> _list = [];
  
  
  @override
  update(List<Map<String, String>> list, { required bool scrolling }) {
    
  }
  
}