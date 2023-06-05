import 'package:flutter/material.dart';
import 'package:flutter_quizzes/pojo/AppColors.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'InformationPage.dart';
import 'morePage.dart';

class Item {
  final String imagePath;
  final String text;

  Item({required this.imagePath, required this.text});
}

class Service extends StatelessWidget {
  List<Item> items = [
    Item(imagePath: 'asset/1.svg', text: 'Service 1'),
    Item(imagePath: 'asset/2.svg', text: 'Service 2'),
    Item(imagePath: 'asset/3.svg', text: 'Service 3'),
    Item(imagePath: 'asset/4.svg', text: 'Service 4'),
    Item(imagePath: 'asset/5.svg', text: 'Service 5'),
    Item(imagePath: 'asset/6.svg', text: 'Service 6'),
    Item(imagePath: 'asset/7.svg', text: 'Service 7'),
    Item(imagePath: 'asset/1.svg', text: 'Service 8'),
    Item(imagePath: 'asset/2.svg', text: 'Service 9'),
    Item(imagePath: 'asset/3.svg', text: 'Service 10'),
    Item(imagePath: 'asset/4.svg', text: 'Service 11'),
    Item(imagePath: 'asset/5.svg', text: 'Service 12'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            ClipPath(
              clipper: CustomCurveClipper(),
              child: Container(
                padding: EdgeInsets.only(top: 40),
                width: double.infinity,
                height: 240,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color(0xFF0E4DFB),
                      Color(0xFF6FC8FB),
                    ],
                  ),
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    SizedBox(width: 50,),
                    SvgPicture.asset(
                      'asset/service.svg',
                      width: 53,
                      height: 33,
                    ),
                      SvgPicture.asset(
                        'asset/ic_notfication.svg',
                      ),
                  ],),
                  SizedBox(height: 40,),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 300,
                      height: 87,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),]),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Select Service',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: AppColors.Screen,
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.all(20),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 1,
                ),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      String selectedText = items[index].text;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InformationPage(
                            text: selectedText,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      width: 93,
                      height: 86,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.pink,
                          width: .5,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            items[index].imagePath,
                            width: 40,
                            height: 40,
                          ),
                          SizedBox(height: 10),
                          Text(
                            items[index].text,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
