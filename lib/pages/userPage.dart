import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../auth/login.dart';
import '../controller/SharedPreferencesController.dart';
import '../pojo/AppColors.dart';

class UserPage extends StatefulWidget {
  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 300,
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Stack(
              children: [
                Positioned(
                    top: 40,
                    right: 10,
                    child: const Icon(
                      Icons.settings,
                      size: 20,
                      color: Colors.white,
                    )),
                Positioned(
                  top: 150,
                  right: 0,
                  left: 0,
                  child: Container(
                    width: 375,
                    height: 159,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15),
                          topLeft: Radius.circular(15)),
                    ),
                  ),
                ),
                Positioned(
                  top: 100,
                  child: Container(
                    width: 104,
                    height: 104,
                    margin: EdgeInsets.symmetric(horizontal: 120),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Image.asset(
                      'asset/user.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                    top: 200,
                    right: 100,
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.edit,
                          size: 20,
                          color: Colors.blue,
                        ))),
                Positioned(
                  top: 230,
                  right: 0,
                  left: 0,
                  child: Column(
                    children: [
                      Text("Seraj Al Mutawa",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.black,fontSize: 20)),
                      Text("Riyadh, Saudi Arabia")
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            color: Colors.white,
            child: Column(children: [
              ListTile(
                title: Text('Language Settings'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('English'),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ),
              ListTile(
                title: Text('Contact Us'),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                title: Text('My Rates'),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                title: Text('Share the App'),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ]),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            color: Colors.white,
            alignment: Alignment.center,
            padding: EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                showDialog(context: context, builder: (context) {
                  return Dialog(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        IconButton(onPressed:(){
                          Navigator.pop(context);
                        },icon: Icon(Icons.logout)),
                        SizedBox(height: 10,),
                       Text("R U Sure?"),
                        Align(
                            alignment: AlignmentDirectional.center,
                            child: ElevatedButton(
                              onPressed: () async {
                                SharedPreferences prefs = await SharedPreferences.getInstance();
                                await prefs.remove('login');

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Login()),
                                );
                              },
                              child: Text("Log Out"),
                            )
                        )

                      ],
                    ),
                  );
                },);

              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.logout,
                    color: Colors.brown,
                  ),
                  Text('Sign Out',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Colors.blue)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: UserPage(),
  ));
}
