import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_final_project_tsa/widget/kategori.dart';
import 'package:flutter_final_project_tsa/widget/test.dart';
import 'firebase_options.dart';
import 'package:flutter_final_project_tsa/firebase_options.dart';
import 'package:flutter_final_project_tsa/widget/gambar.dart';
import 'package:flutter_final_project_tsa/widget/profile.dart';
import 'widget/splash_screen.dart';
import 'widget/login.dart';
import 'widget/register.dart';
import 'widget/kosakata.dart';
import 'widget/reading.dart';
import 'widget/listening.dart';
import 'widget/profile.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashScreenPage());
  }
}
