import 'package:flutter/material.dart';
import 'package:train_in/view/assets/palette.dart';
import 'package:train_in/view/assets/trainin_icons.dart';
import 'package:train_in/view/components/actions/add_btn.dart';
import 'package:train_in/view/components/area_label.dart';
import 'package:train_in/view/components/headers/back_header.dart';
import 'package:train_in/view/components/button.dart';
import 'package:train_in/view/components/stat_label.dart';
import 'package:train_in/view/components/training_label.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BackHeader(),
      body: _main(context),
      // bottomNavigationBar: NavBar(),
      floatingActionButton: AddButton(callback: (){})
    );
  }

  Widget _main(BuildContext ctx) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _userInfos(),
            const AreaLabel(text: 'Metas'),
            _noGoals(ctx)
          ]
        ),
      )
    );
  }

  Widget _userInfos() {
    return Container(
      height: 120,
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _userLabel(),
          _stats(),
        ]
      ),
    );
  }

  Widget _userLabel() {
    return Row(
        children: [
          CircleAvatar(
            radius: 34,
            backgroundColor: Palette.items,
            child: Text('U', style: TextStyle(color: Palette.yellow, fontWeight: FontWeight.bold, fontSize: 26),),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text('{username}', style: TextStyle(color: Palette.white, fontWeight: FontWeight.bold))  
          )
        ]);
  }

  Widget _stats() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        StatLabel(
          // Indicar quantas calorias em média, já foram gastas
          icon: TraininIcons.kcal,
          title: 'Calorias',
          subtitle: '{000} kcal'
        ),
        StatLabel(
          // Indicar quanto peso 
          icon: TraininIcons.dumbell,
          title: 'Peso',
          subtitle: '{000} Kg'
        )
      ],
    );
  }

  Widget _goals() {
    return Column(
      children: List.generate(5, (index) => TrainingLabel(title: '{meta}', subtitle: '{objetivo}', callback: (){})),
    );
  }

  Widget _noGoals(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      height: 90,
      margin: const EdgeInsets.only(top: 100),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Você ainda não possui metas.', style: TextStyle(color: Palette.white),),
            Button(
              content: 'Criar Meta',
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
              callback: () {
                print('hi');
              }
            )
          ],
        ),
      );
  }
}