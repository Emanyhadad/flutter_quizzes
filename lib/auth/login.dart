import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_quizzes/controller/api_controller.dart';
import 'package:flutter_quizzes/pojo/ApiResponse.dart';
import 'package:flutter_quizzes/auth/sign_up.dart';
import 'package:http/http.dart' as http;
import '../pages/home.dart';
import '../pojo/AppColors.dart';
import '../controller/SharedPreferencesController.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with TickerProviderStateMixin {
  late TabController controllerTab;
  bool rememberMe = false;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    controllerTab = new TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.Screen,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              height: 170,
              padding: EdgeInsets.all(40),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.blue, AppColors.Screen],
                ),
              ),
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                'asset/splash.png',
                height: 100,
                width: 133,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30)),
              ),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    DefaultTabController(
                      length: 2,
                      child: TabBar(
                        indicatorColor: Colors.blue,
                        indicatorSize: TabBarIndicatorSize.values[1],
                        indicatorPadding: EdgeInsets.symmetric(horizontal: 14),
                        indicatorWeight: 2,
                        labelColor: Colors.blue,
                        controller: controllerTab,
                        unselectedLabelColor: Colors.grey,
                        tabs: [
                          Tab(
                              text:
                                  AppLocalizations.of(context).serviceProvider,
                              height: 48),
                          Tab(
                              text: AppLocalizations.of(context).customer,
                              height: 48),
                        ],
                      ),
                    ),
                    SizedBox(height: 16.0),
                    // TextField(
                    //   controller: _phoneController,
                    //   decoration: InputDecoration(
                    //     labelStyle: TextStyle(color: Colors.blue),
                    //     hintText: '00000',
                    //     hintStyle: TextStyle(
                    //       color: Colors.grey,
                    //       fontSize: 16,
                    //     ),
                    //     fillColor: Colors.white,
                    //     filled: true,
                    //     contentPadding:
                    //     EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    //     focusedBorder: OutlineInputBorder(
                    //       borderRadius: BorderRadius.all(Radius.circular(5)),
                    //       borderSide: BorderSide(
                    //         color: Colors.blue,
                    //         width: 1,
                    //         style: BorderStyle.solid,
                    //       ),
                    //     ),
                    //     enabledBorder: OutlineInputBorder(
                    //       borderRadius: BorderRadius.all(Radius.circular(5)),
                    //       borderSide: BorderSide(
                    //         color: AppColors.stroke2,
                    //         width: 1,
                    //         style: BorderStyle.solid,
                    //       ),
                    //     ),
                    //     prefixIcon: Padding(
                    //       padding: const EdgeInsets.only(left: 15, right: 15),
                    //       child: DropdownButton<String>(
                    //         items: [
                    //           DropdownMenuItem<String>(
                    //             value: '+966',
                    //             child: Row(
                    //               children: [
                    //                 CircleAvatar(
                    //                   child: Image.asset('asset/splash.png'),
                    //                   radius: 15,
                    //                 ),
                    //                 Text("+966")
                    //               ],
                    //             ),
                    //           ),
                    //           DropdownMenuItem<String>(
                    //             value: '+91',
                    //             child: Row(
                    //               children: [
                    //                 CircleAvatar(
                    //                   child: Image.asset('asset/splash.png'),
                    //                   radius: 15,
                    //                 ),
                    //                 Text("+91")
                    //               ],
                    //             ),
                    //           ),
                    //           // Add more options as needed
                    //         ],
                    //         value: '+966', // Default value
                    //         onChanged: (value) {},
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    TextField(
                      controller: _emailController,
                      cursorColor: Colors.blue,
                      decoration: InputDecoration(
                        labelStyle: TextStyle(color: Colors.blue),
                        hintText: 'Email',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          borderSide: BorderSide(
                            color: Colors.blue,
                            width: 1,
                            style: BorderStyle.solid,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          borderSide: BorderSide(
                            color: AppColors.stroke2,
                            width: 1,
                            style: BorderStyle.solid,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    TextField(
                      textAlign: TextAlign.center,
                      controller: _passwordController,
                      cursorColor: Colors.blue,
                      decoration: InputDecoration(
                        labelStyle: TextStyle(color: Colors.blue),
                        hintText: '***********',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                        fillColor: AppColors.background,
                        filled: true,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          borderSide: BorderSide(
                            color: Colors.blue,
                            width: 1,
                            style: BorderStyle.solid,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          borderSide: BorderSide(
                            color: AppColors.stroke2,
                            width: 1,
                            style: BorderStyle.solid,
                          ),
                        ),
                        suffixIcon: Icon(Icons.remove_red_eye),
                      ),
                      obscureText: true,
                    ),
                    SizedBox(height: 16.0),
                    Row(
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              shape: CircleBorder(),
                              value: rememberMe,
                              onChanged: (value) {
                                setState(() {
                                  rememberMe = value!;
                                });
                              },
                            ),
                            Text(AppLocalizations.of(context).rememberMe),
                          ],
                        ),
                        Spacer(),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                              AppLocalizations.of(context).forgotPassword,
                              style: TextStyle(color: Colors.black)),
                        ),
                      ],
                    ),
                    SizedBox(height: 40.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(AppLocalizations.of(context).newMember,
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700)),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) {
                                    return SignUp();
                                  }));
                                },
                                child: Text(
                                  AppLocalizations.of(context).signUp,
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: ElevatedButton(
                            style: ButtonStyle(),
                            onPressed: () async {
                              _prefomLogin();
                            },
                            child: SizedBox(
                              height: 55,
                              child: Center(
                                child: Text(
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                  AppLocalizations.of(context).login,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _prefomLogin() async {
    if (_checkData()) {
      await _login();
    }
  }

  bool _checkData() {
    if (_emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty &&
        _passwordController.text.length >= 6 &&
        _passwordController.text.length <= 30) {
      return true;
    }
    return false;
  }

  Future<void> _login() async {
    ApiResponse response = await ApiController().Login(
        email: _emailController.text, password: _passwordController.text);
    print("response${response.success}");
    print("response${response.data}");
    if (response.success!) {
      print(response.success);
      SharedPreferencesController c = SharedPreferencesController();
      await c.getInit();
      c.setData(key: "login", value: rememberMe);
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return Home();
      }));
    }
  }

  Future<void> loginUser({email, password}) async {
    var email1 = email;
    var password1 = password;

    var url = Uri.parse('https://studentucas.awamr.com/api/auth/login/user');
    var body = json.encode({
      'email': email1,
      'password': password1,
    });

    var response = await http.post(url, body: body, headers: {
      'Content-Type': 'application/json',
    });

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      print(data['code']);
      print(data['success']);
      print(data['message']);
      print('تم تسجيل دخول المستخدم بنجاح');
      SharedPreferencesController c = SharedPreferencesController();
      await c.getInit();
      c.setData(key: "login", value: rememberMe);
      if (rememberMe) {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return Home();
        }));
      }
    } else {
      print('حدث خطأ أثناء تسجيل الدخول. الحالة: ${response.statusCode}');
    }
  }
}
