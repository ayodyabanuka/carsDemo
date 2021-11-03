import 'package:cars_app/HomePage.dart';
import 'package:cars_app/Screens/splashScreen.dart';
import 'package:cars_app/controller/facebook_login_controller.dart';
import 'package:cars_app/controller/google_login_controller.dart';
import 'package:cars_app/login.dart';
import 'package:cars_app/provider/carDetailsProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => GoogleSignInController(),
            child: LoginPage(),
          ),
          ChangeNotifierProvider(
            create: (context) => FacebookSignInController(),
            child: LoginPage(),
          ),
          ChangeNotifierProvider(
            create: (context) => carProvider(),
            child: HomePage(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: HomePage(),
        ));
  }
}
