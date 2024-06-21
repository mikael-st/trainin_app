import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:train_in/service/app_initialize.dart';
import 'package:train_in/service/database/models/exercise_model.dart';
import 'package:train_in/service/date.dart';
import 'package:train_in/service/dto/exercise.dart';
import 'package:train_in/service/providers/exercise_provider.dart';
import 'package:train_in/service/repositories/exercise_repository.dart';
import 'package:train_in/view/assets/palette.dart';
import 'package:train_in/view/pages/exercises.dart';

void main() async {
  runApp(
    const App()
  );
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late Stream<List<Exercise>> _list;
  final initialize = ApplicationInitialize();
  bool hasBeenInitialize = false;

  void _initialized() {
    setState(() {
      hasBeenInitialize = true;      
    });
  }

  @override
  void initState() {
    super.initState();
    Date.setToday(DateTime.now());
    initialize.init().then(
      (value) {
        list = value;
        _initialized();
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(systemNavigationBarColor: Palette.items));
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: MaterialApp(
      theme: ThemeData(
        dividerTheme: DividerThemeData(
          color: Palette.yellow,
          indent: 10,
          endIndent: 0
        ),
        pageTransitionsTheme: null,
        scaffoldBackgroundColor: Palette.background,
        primaryTextTheme: GoogleFonts.outfitTextTheme(),
        textTheme: GoogleFonts.montserratTextTheme(),
        fontFamily: 'Montserrat',
      ),
      home: hasBeenInitialize
              ? StreamBuilder(
                  stream: _list,
                  builder: (context, list) {
                    if (!list.hasData) {
                      return Center(
                        child: Text(
                          'Fetching Exercises',
                          style: TextStyle(
                            color: Palette.white
                          ),
                        ),
                      );
                    }
                    return Container(
                      alignment: Alignment.center,
                      width: 52,
                      height: 52,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: MemoryImage(list.data![0].image),
                          fit: BoxFit.cover
                        )
                      ),
                    );
                    
                    /* ExercisesPage(
                      list: list.data!.map(
                        (e) => ExerciseDTO(
                          id: e.id,
                          name: e.name,
                          target: e.muscle,
                          image: e.image
                        )
                      ).toList()
                    ); */
                  }
                )
              : Center(
                child: CircularProgressIndicator(color: Palette.yellow)
              )
      
      /* hasBeenInitialize
              ? ExercisesPage(
                      list: _list.map(
                        (e) => ExerciseDTO(
                            id: e.id,
                            name: e.name,
                            target: e.muscle,
                            image: e.image
                          )
                      ).toList()
                    )
              : Center(child: CircularProgressIndicator(color: Palette.yellow)), */
      // initialRoute: '/login',
      // getPages: [
        // GetPage(name: '/login', page: () => const LoginPage()),
        // GetPage(name: '/main', page: () => const Main()),
        // GetPage(name: '/create_account', page: () => const CreateAccountPage()),
        // GetPage(name: '/training', page: () => const TrainingPage()),
        // GetPage(name: '/edit_training', page: () => EditTrainingPage())
      // ],
      ),
    );
  }

  set list(Stream<List<Exercise>> value) => setState(() => _list = value);
}
