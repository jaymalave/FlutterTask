import 'package:flutter/material.dart';
import 'package:flutter_task/auth/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_task/controllers/userdata_controller.dart';
import 'package:flutter_task/utils/colors.dart';
import 'package:flutter_task/views/home_page.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static var phone;
  // bool checkIfLoggedIn() {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   phone = await prefs.getString('phone');
  //   if (phone != null) {
  //     return true;
  //   }
  //   return false;
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: const MaterialColor(0xFFF05454, AppPallete.color),
        textTheme: const TextTheme(
          bodyText1: TextStyle(),
          bodyText2: TextStyle(),
        ).apply(
          bodyColor: AppPallete.textLight,
          displayColor: AppPallete.textLight,
        ),
      ),
      home: const Scaffold(body: LoginView()),
    );
  }
}
