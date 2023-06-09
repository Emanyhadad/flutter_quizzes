import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_quizzes/pojo/AppColors.dart';
import 'package:flutter_quizzes/controller/SharedPreferencesController.dart';
import 'package:flutter_quizzes/auth/login.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'home.dart';
import 'mainpage.dart';
import 'onBording.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await SharedPreferencesController().getInit();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        showSemanticsDebugger: false,
        title: 'Flutter Demo',
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('en'),
          Locale('ar'),
        ],
        locale: Locale('en'),
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          "login": (context) => Login(),
          "home": (context) => Home(),
        },
        debugShowCheckedModeBanner: false,
        home: SplashPage());
  }
}

class SplashPage extends StatefulWidget {
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  // @override
  // void initState() {
  //   super.initState();
  //   Timer(Duration(seconds: 3), () {
  //     Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //             builder: (context) =>
  //                 SharedPreferencesController().getData("login") ?? false
  //                     ? Home()
  //                     : Login()));
  //   });
  // }
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () async {
      final bool isLoggedIn =
          await SharedPreferencesController().getData("login") ?? false;
      final bool onBording1 =
          await SharedPreferencesController().getData("newUser") ?? false;

      if (!onBording1) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => onBoardingPages(),
            ));
      } else {
        if (isLoggedIn) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Home()),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Login()),
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.blue, AppColors.Screen],
            ),
          ),
          child: Align(
            alignment: Alignment.centerRight,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Image.asset(
                'asset/splash.png',
                width: 422,
                height: 341,
              ),
            ),
          )),
    );
  }
}
