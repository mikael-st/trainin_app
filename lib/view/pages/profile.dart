import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:train_in/view/assets/palette.dart';
import 'package:train_in/view/assets/trainin_icons.dart';
import 'package:train_in/view/components/actions/add_btn.dart';
import 'package:train_in/view/components/area_label.dart';
import 'package:train_in/view/components/headers/back_header.dart';
import 'package:train_in/view/components/button.dart';
import 'package:train_in/view/components/navbar.dart';
import 'package:train_in/view/components/stat_label.dart';
import 'package:train_in/view/components/training_label.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackHeader(),
      body: _main(context),
      // bottomNavigationBar: NavBar(),
      floatingActionButton: AddButton()
    );
  }

  Widget _main(BuildContext ctx) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _userInfos(),
            AreaLabel(text: 'Metas'),
            _noGoals(ctx)
          ]
        ),
      )
    );
  }

  Widget _userInfos() {
    return Container(
      height: 120,
      margin: EdgeInsets.only(bottom: 20),
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
            padding: EdgeInsets.only(left: 10),
            child: Text('{username}', style: TextStyle(color: Palette.white, fontWeight: FontWeight.bold))  
          )
        ]);
  }

  Widget _stats() {
    return Row(
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
      children: List.generate(5, (index) => TrainingLabel(title: '{meta}', subtitle: '{objetivo}')),
    );
  }

  Widget _noGoals(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      height: 90,
      margin: EdgeInsets.only(top: 100),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Você ainda não possui metas.', style: TextStyle(color: Palette.white),),
            Button(
              content: 'Criar Meta',
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
              callback: () {
                print('hi');
              }
            )
          ],
        ),
      );
  }
}