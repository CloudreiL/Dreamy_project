import 'package:dreamy_project/pages/registration_login/login_page.dart';
import 'package:dreamy_project/pages/registration_login/login_page.dart';
import 'package:dreamy_project/pages/registration_login/email.dart';
import 'package:dreamy_project/classes/curvednavbar.dart';
import 'package:dreamy_project/pages/registration_login/registration_page.dart';
import 'package:dreamy_project/services/firebase_stream.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
        routes: {
          '/': (context) => const FirebaseStream(),
          '/login': (context) => const LoginPage(),
          '/registration': (context) => const RegPage(),
          '/navbar': (context) => const BottomNavBar()
        },
      initialRoute: '/',
    );
  }
}

