import 'package:flutter/material.dart';
import 'package:flutter_task/auth/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_task/controllers/userdata_controller.dart';
import 'package:flutter_task/utils/colors.dart';
import 'package:flutter_task/controllers/user_preferences.dart';
import 'package:flutter_task/views/home_page.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await UserPreferences.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  MaterialColor colorCustom = const MaterialColor(0xFF880E4F, AppPallete.color);

 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: colorCustom),
      home: Scaffold(
          body: UserPreferences.checkState()
              ? const HomePage()
              : const LoginView()),
    );
  }
}
