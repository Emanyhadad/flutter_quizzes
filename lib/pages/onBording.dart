import 'package:flutter/material.dart';

import '../auth/login.dart';
import '../controller/SharedPreferencesController.dart';
import 'home.dart';

class BoardingPage extends StatelessWidget {
  final String imagePath;
  final String text;
  final VoidCallback onPressed;

  BoardingPage({required this.imagePath, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath),
          SizedBox(height: 20),
          Text(
            text,
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 40),
          ElevatedButton(
            onPressed: onPressed,
            child: Text('SKIP'),
          ),
        ],
      ),
    );
  }
}

class BoardingScreen extends StatelessWidget {
  final List<BoardingPage> pages;

  BoardingScreen({required this.pages});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: pages.length,
        itemBuilder: (context, index) {
          return pages[index];
        },
      ),
    );
  }
}

void main() {
  runApp(onBoardingPages());
}

class onBoardingPages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  BoardingScreen(
      pages: [
        BoardingPage(
          imagePath: 'asset/onbording2.png',
          text: 'Fast reservation with technicians and craftsmen',
          onPressed: () async {
            SharedPreferencesController c = SharedPreferencesController();
            await c.getInit();
            c.setData(key: "newUser", value: true);
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return Login();
            }));
          },
        ),
        BoardingPage(
          imagePath: 'asset/onbording.png',
          text: 'Fast reservation with technicians and craftsmen',
          onPressed: () async {
            SharedPreferencesController c = SharedPreferencesController();
            await c.getInit();
            c.setData(key: "newUser", value: true);
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return Login();
            }));
          },
        ),
        BoardingPage(
          imagePath: 'asset/onbording2.png',
          text: 'Fast reservation with technicians and craftsmen',
          onPressed: () async {
            SharedPreferencesController c = SharedPreferencesController();
            await c.getInit();
            c.setData(key: "newUser", value: true);
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return Login();
            }));
          },
        ),
      ],
    );

  }
}
