import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:train_in/service/database/models/training_model.dart';
import 'package:train_in/service/repositories/training_repository.dart';
import 'package:train_in/view/assets/palette.dart';
import 'package:train_in/view/components/area_label.dart';
import 'package:train_in/view/components/headers/header.dart';
import 'package:train_in/view/components/navbar.dart';
import 'package:train_in/view/components/training_box.dart';
import 'package:train_in/view/components/training_label.dart';


class HomePage extends StatelessWidget {
  late TrainingRepository _repository;
  HomePage({super.key, required TrainingRepository repository}){
    _repository = repository;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Header(),
        body: _main(),
        bottomNavigationBar: NavBar(),
      );
  }

  Widget _main() {
    return Container(
      alignment: Alignment.topCenter,
      child: SingleChildScrollView(
        clipBehavior: Clip.none,
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const AreaLabel(text: 'Treino de hoje'),
            const TrainingBox(),
            const AreaLabel(text: 'Restrospectiva'),
            _retrospective(_repository.getDoned())
          ],
        ),
      ),
    );
  }

  Widget _retrospective(Stream<List<Training>> stream) {
    return StreamBuilder(
      stream: stream,
      builder: (context, list) {
        if (list.hasData && list.data!.isNotEmpty) {
          return Column(
            children: List.generate(
              list.data!.length,
              (index) => TrainingLabel(title: '{nome}', subtitle: '{00} min   •   {dia}', callback: (){})),
          );
        }
        return Container(
          margin: EdgeInsets.only(top: 100),
          child: Text('Você ainda não realizou nenhum treino.', style: TextStyle(color: Palette.white)),
        );
      }
    );
    /* Column(
      children: List.generate(5, (index) => TrainingLabel(title: '{nome}', subtitle: '{00} min   •   {dia}', callback: (){})),
    ); */
  }
}
