import 'package:coffee/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_database/firebase_database.dart';
import 'screens/products_screen.dart';
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}
  ThemeData localTheme = ThemeData.light();
  ThemeModel model = ThemeModel();
// ignore: must_be_immutable
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

//Метод, который будет вызываться при уведомлении
_listener() {
  localTheme = model.theme;
  updTheme();
}



//Обновление состояния корневого виджета для обновления темы
  updTheme(){
    setState(() {
    });
  }

  @override
  void initState() {
    //Добавление прослушки значения темы
    model.addListener(_listener, ['theme']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: localTheme,
      themeMode: ThemeMode.system,
      // themeMode: ThemeMode.system,
      home: SplashScreen(),
    );
  }
}
// ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 235, 75, 27)),
//         useMaterial3: true,
//       ),