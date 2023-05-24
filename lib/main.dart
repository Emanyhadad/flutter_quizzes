import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_quizzes/SharedPreferencesController.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'home.dart';
import 'login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  SharedPreferencesController().getData("login") ?? false
                      ? Home()
                      : Login()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.network(
            "https://th.bing.com/th/id/OIP.7IB8knZlkf8V-E9-8vU4HgHaDn?pid=ImgDet&rs=1"),
      ),
    );
  }
}
