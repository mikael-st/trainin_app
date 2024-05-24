import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:train_in/service/globals.dart';
import 'package:train_in/service/storage.dart';
import 'package:train_in/view/assets/palette.dart';
import 'package:train_in/view/pages/create_account.dart';
import 'package:train_in/view/pages/edit_training.dart';
import 'package:train_in/view/pages/login.dart';
import 'package:train_in/view/pages/main_page.dart';
import 'package:train_in/view/pages/training.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveConfig.start();
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

  @override
  void initState() {
    super.initState();
    Globals.setToday(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(systemNavigationBarColor: Palette.items));
    return GetMaterialApp(
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
        fontFamily: 'Poppins'
      ),
      initialRoute: '/login',
      getPages: [
        GetPage(name: '/login', page: () => const LoginPage()),
        GetPage(name: '/main', page: () => const Main()),
        GetPage(name: '/create_account', page: () => const CreateAccountPage()),
        GetPage(name: '/training', page: () => const TrainingPage()),
        GetPage(name: '/edit_training', page: () => EditTrainingPage())
      ],
    );
  }
}
