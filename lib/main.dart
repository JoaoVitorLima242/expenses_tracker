import 'package:expenses_tracker/screens/expenses_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

var customColorScheme = ColorScheme.fromSeed(
  seedColor: const Color(0xff00b4d8),
);

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((fn) {
    runApp(
      MaterialApp(
        theme: ThemeData(brightness: Brightness.light),
        darkTheme: ThemeData(brightness: Brightness.dark),
        themeMode: ThemeMode.system,
        home: const ExpensesScreen(),
      ),
    );
  });
}
