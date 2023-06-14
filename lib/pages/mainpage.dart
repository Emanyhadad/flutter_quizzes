import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quizzes/pages/ordersPage.dart';
import 'package:flutter_quizzes/pages/servicePage.dart';
import 'package:flutter_quizzes/pages/userPage.dart';
import 'package:flutter_svg/svg.dart';


import '../pojo/AppColors.dart';
import '../pojo/user.dart';

import 'morePage.dart';


class MyHomePage0 extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage0> {
  int Index = 0;

  final List<Widget> Pages = [
    Service(),
    Orders(),
    UserPage(),
    More(),

  ];

  void onTabTapped(int index) {
    setState(() {
      Index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        backgroundColor: AppColors.Screen,
        body: Pages[Index],
        bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped,
          currentIndex: Index,
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.Screen,
          unselectedLabelStyle: TextStyle(color: Colors.white),
          selectedLabelStyle:TextStyle(color: Colors.blue) ,
          items: [
            BottomNavigationBarItem(
              activeIcon:SvgPicture.asset(
              'asset/service.svg',
                width: 20,
                height: 20,

        ) ,
              icon: SvgPicture.asset(
                'asset/service.svg',
                width: 20,
                height: 20,
              ),
              label: 'Service',

            ),
            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
            'asset/order.svg',
            width: 20,
            height: 20,

              ) ,
                icon:  SvgPicture.asset(
                  'asset/order.svg',
              width: 20,
              height: 20,
            ),
                label: 'Order'
            ),
            BottomNavigationBarItem(
              activeIcon:SvgPicture.asset(
                'asset/account.svg',
                width: 20,
                height: 20,

              ) ,
              icon:SvgPicture.asset(
                'asset/account.svg',
                width: 20,
                height: 20,

              ),
              label: 'Account',
            ),
            BottomNavigationBarItem(
              activeIcon:SvgPicture.asset(
                'asset/more.svg',
                width: 5,
                height: 5,

              ) ,
              icon:SvgPicture.asset(
                'asset/more.svg',
                width: 5,
                height: 5,
              ),
              label: 'More',
            ),
          ],
        ),
      );
  }
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //       backgroundColor: AppColors.Screen,
  //       body: Pages[Index],
  //       bottomNavigationBar: Container(
  //         color: Colors.blue,
  //         child: BottomNavigationBar(
  //           onTap: onTabTapped,
  //           currentIndex: Index,
  //           items: [
  //             BottomNavigationBarItem(
  //               activeIcon:SvgPicture.asset(
  //                 'asset/service.svg',
  //                 width: 20,
  //                 height: 20,
  //
  //               ) ,
  //               icon: SvgPicture.asset(
  //                 'asset/service.svg',
  //                 width: 20,
  //                 height: 20,
  //               ),
  //               label: 'Service',
  //             ),
  //             BottomNavigationBarItem(
  //                 activeIcon: SvgPicture.asset(
  //                   'asset/order.svg',
  //                   width: 20,
  //                   height: 20,
  //
  //                 ) ,
  //                 icon:  SvgPicture.asset(
  //                   'asset/order.svg',
  //                   width: 20,
  //                   height: 20,
  //                 ),
  //                 label: 'Order'
  //             ),
  //             BottomNavigationBarItem(
  //               activeIcon:SvgPicture.asset(
  //                 'asset/account.svg',
  //                 width: 20,
  //                 height: 20,
  //
  //               ) ,
  //
  //               icon:SvgPicture.asset(
  //                 'asset/account.svg',
  //                 width: 20,
  //                 height: 20,
  //
  //               ),
  //               label: 'Account',
  //             ),
  //             BottomNavigationBarItem(
  //               activeIcon:SvgPicture.asset(
  //                 'asset/more.svg',
  //                 width: 20,
  //                 height: 20,
  //
  //               ) ,
  //
  //               icon:SvgPicture.asset(
  //                 'asset/more.svg',
  //                 width: 20,
  //                 height: 20,
  //               ),
  //               label: 'More',
  //             ),
  //           ],
  //         ),
  //       ));
  // }
}
