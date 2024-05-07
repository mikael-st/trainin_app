import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:train_in/assets/globals.dart';
import 'package:train_in/assets/palette.dart';
import 'package:train_in/pages/home.dart';
import 'package:train_in/pages/training.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  @override
  void initState() {
    super.initState();
    Globals.setToday(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(systemNavigationBarColor: Palette.items));
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);
    return MaterialApp(
      theme: ThemeData(
        dividerTheme: DividerThemeData(
          color: Palette.yellow,
          indent: 10,
          endIndent: 0
        ),
        pageTransitionsTheme: null,
        scaffoldBackgroundColor: Palette.background,
        primaryTextTheme: GoogleFonts.outfitTextTheme(),
        textTheme: GoogleFonts.poppinsTextTheme(),
        fontFamily: 'Poppins'
      ),
      home: TrainingPage(),
    );
  }
}