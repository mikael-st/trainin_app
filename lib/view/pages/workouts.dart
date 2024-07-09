import 'package:flutter/material.dart';
import 'package:train_in/service/database/models/training_model.dart';
import 'package:train_in/service/repositories/training_repository.dart';
import 'package:train_in/view/assets/palette.dart';
import 'package:train_in/view/components/actions/add_btn.dart';
import 'package:train_in/view/components/area_label.dart';
import 'package:train_in/view/components/headers/back_header.dart';
import 'package:train_in/view/components/modals/create_training.dart';
import 'package:train_in/view/components/navbar.dart';
import 'package:train_in/view/components/training_label.dart';

// ignore: must_be_immutable
class MyWorkoutsPage extends StatelessWidget {
  late TrainingRepository _repository;
  MyWorkoutsPage({super.key, required TrainingRepository repository}){
    _repository = repository;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BackHeader(),
      body: _main(context),
      bottomNavigationBar: NavBar(),
      floatingActionButton: AddButton(callback: () => showModalBottomSheet(context: context, builder: (BuildContext context) => CreateTraining(repository: _repository))),
    );
  }

  Widget _main(BuildContext context) {
    return StreamBuilder(
      stream: _repository.getAll(),
      builder: (context, list) {
        return Container(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            clipBehavior: Clip.none,
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                const AreaLabel(text: 'Seus Treinos'),
                list.hasData && list.data!.isNotEmpty
                  ? _training(context, list: list.data!)
                  : _noTraining(context)
              ],
            ),
          )
        );
      }
    );
  }

  Widget _noTraining(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      height: 90,
      margin: const EdgeInsets.only(top: 100),
      child: Text('Você ainda não possui treinos.', style: TextStyle(color: Palette.white)),
    );
  }

  Widget _training(BuildContext ctx, {required List<Training> list}) {
    return Column(
      children: List.generate(
        list.length,
        (index) => TrainingLabel(title: list[index].name, subtitle: '${list[index].exercises.length} exercícios', callback: () => Navigator.of(ctx).pushNamed('/training', arguments: _repository.watch(list[index].id)))),
    );
  }
}