import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:train_in/service/database/database.dart';
import 'package:train_in/service/database/models/exercise_model.dart';
import 'package:train_in/service/date.dart';
import 'package:train_in/service/providers/exercise_provider.dart';
import 'package:train_in/service/repositories/exercise_repository.dart';
import 'package:train_in/view/assets/palette.dart';
import 'package:train_in/view/components/modals/exercise_infos.dart';
import 'package:train_in/view/pages/create_account.dart';
import 'package:train_in/view/pages/edit_training.dart';
import 'package:train_in/view/pages/exercises.dart';
import 'package:train_in/view/pages/home.dart';
import 'package:train_in/view/pages/login.dart';
import 'package:train_in/view/pages/profile.dart';
import 'package:train_in/view/pages/training.dart';
import 'package:train_in/view/pages/workouts.dart';

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
  final _database = DB();
  late ExerciseRepository _repository;
  bool hasBeenInitialize = false;


  @override
  void initState() {
    super.initState();
    Date.setToday(DateTime.now());
    _database.init().then(
      (v) => setState(() {
        _repository = ExerciseRepository(provider: ExerciseProvider(dio: Dio()), box: _database.store.box<Exercise>());
        hasBeenInitialize = true;
      })
    );
  }

  @override
  void dispose() {
    super.dispose();
    _database.dispose();
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
          fontFamily: GoogleFonts.montserrat().fontFamily,
        ),
        initialRoute: '/home',
        routes: {
          '/login': (context) => LoginPage(),
          '/create_account': (context) => CreateAccountPage(),
          '/home': (context) => hasBeenInitialize ? HomePage() : Center( child: CircularProgressIndicator( color: Palette.yellow )),
          '/my_workouts': (context) => MyWorkoutsPage(),
          '/profile': (context) => ProfilePage(),
          '/training': (context) => TrainingPage(),
          '/edit_training': (context) => EditTrainingPage(),
          '/exercises': (context) => ExercisesPage(repository: _repository),
          '/exercise_info': (context) => ExerciseInfos()
        },
      ),
    );
  }
}
