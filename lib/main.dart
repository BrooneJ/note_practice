import 'package:flutter/material.dart';
import 'package:note_app/di/di_setup.dart';
import 'package:note_app/router.dart';
import 'package:note_app/ui/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme.light(
          primary: Colors.white,
          background: darkGray,
        ),
        floatingActionButtonTheme:
            Theme.of(context).floatingActionButtonTheme.copyWith(
                  backgroundColor: Colors.white,
                  foregroundColor: darkGray,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
        appBarTheme: const AppBarTheme(
          backgroundColor: darkGray,
          foregroundColor: Colors.white,
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 40,
            color: Colors.white,
          ),
        ),
        radioTheme: RadioThemeData(
          fillColor: MaterialStateProperty.all(Colors.white),
        ),
      ),
    );
  }
}
