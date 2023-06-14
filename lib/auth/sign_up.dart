import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_quizzes/auth/login.dart';
import 'package:flutter_quizzes/pojo/ApiResponse.dart';
import 'package:flutter_quizzes/pojo/user.dart';

import '../pages/home.dart';
import '../pojo/AppColors.dart';
import '../controller/SharedPreferencesController.dart';
import '../controller/api_controller.dart';
import 'package:http/http.dart' as http;

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> with TickerProviderStateMixin {
  late TabController controllerTab;

  bool rememberMe = false;
  int _currentTabIndex = 0;
  late TextEditingController _phoneController;

  late TextEditingController _passwordController;

  late TextEditingController _fullNameController;

  late TextEditingController _emailController;

  late TextEditingController _ServiceController;

  void _handleTabChange() {
    setState(() {
      _currentTabIndex = controllerTab.index;
    });
  }

  @override
  void initState() {
    super.initState();
    controllerTab = TabController(length: 2, vsync: this);
    controllerTab.addListener(_handleTabChange);
    _phoneController = TextEditingController();
    _passwordController = TextEditingController();
    _fullNameController = TextEditingController();
    _emailController = TextEditingController();
    _ServiceController = TextEditingController();
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    _fullNameController.dispose();
    _emailController.dispose();
    _ServiceController.dispose();
    controllerTab.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var _selectedOccupation;
    return Scaffold(
      backgroundColor: AppColors.Screen,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 200,
              padding: EdgeInsets.all(40),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.blue, AppColors.Screen],
                ),
              ),
              alignment: Alignment.bottomCenter,
            ),
            Container(
              height:  MediaQuery.of(context).size.height/1.2,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15),
                  topLeft: Radius.circular(15),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    DefaultTabController(
                      length: 2,
                      child: TabBar(
                        indicatorColor: Colors.blue,
                        indicatorSize: TabBarIndicatorSize.label,
                        indicatorPadding: EdgeInsets.symmetric(horizontal: 14),
                        indicatorWeight: 2,
                        labelColor: Colors.blue,
                        controller: controllerTab,
                        unselectedLabelColor: Colors.grey,
                        tabs: [
                          Tab(
                            text: AppLocalizations.of(context)!.serviceProvider,
                            height: 48,
                          ),
                          Tab(
                            text: AppLocalizations.of(context)!.customer,
                            height: 48,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: controllerTab,
                        children: [
                          Column(
                            children: [
                              if (_currentTabIndex == 0) ...[
                                TextField(
                                  controller: _fullNameController,
                                  cursorColor: Colors.blue,
                                  decoration: InputDecoration(
                                    labelStyle: TextStyle(color: Colors.blue),
                                    hintText: 'Full Name',
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                    ),
                                    fillColor: Colors.white,
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 20, horizontal: 20),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      borderSide: BorderSide(
                                        color: Colors.blue,
                                        width: 1,
                                        style: BorderStyle.solid,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
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
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 20, horizontal: 20),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      borderSide: BorderSide(
                                        color: Colors.blue,
                                        width: 1,
                                        style: BorderStyle.solid,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
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
                                  controller: _phoneController,
                                  decoration: InputDecoration(
                                    labelStyle: TextStyle(color: Colors.blue),
                                    hintText: '00000',
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                    ),
                                    fillColor: Colors.white,
                                    filled: true,
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 20, horizontal: 10),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      borderSide: BorderSide(
                                        color: Colors.blue,
                                        width: 1,
                                        style: BorderStyle.solid,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      borderSide: BorderSide(
                                        color: AppColors.stroke2,
                                        width: 1,
                                        style: BorderStyle.solid,
                                      ),
                                    ),
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15, right: 15),
                                      child: DropdownButton<String>(
                                        items: [
                                          DropdownMenuItem<String>(
                                            value: '+966',
                                            child: Row(
                                              children: [
                                                CircleAvatar(
                                                  child: Image.asset(
                                                      'asset/splash.png'),
                                                  radius: 15,
                                                ),
                                                Text("+966")
                                              ],
                                            ),
                                          ),
                                          DropdownMenuItem<String>(
                                            value: '+91',
                                            child: Row(
                                              children: [
                                                CircleAvatar(
                                                  child: Image.asset(
                                                      'asset/splash.png'),
                                                  radius: 15,
                                                ),
                                                Text("+91")
                                              ],
                                            ),
                                          ),
                                          // Add more options as needed
                                        ],
                                        value: '+966', // Default value
                                        onChanged: (value) {},
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
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 20, horizontal: 10),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      borderSide: BorderSide(
                                        color: Colors.blue,
                                        width: 1,
                                        style: BorderStyle.solid,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
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
                                    Checkbox(
                                      shape: CircleBorder(),
                                      value: rememberMe,
                                      onChanged: (value) {
                                        setState(() {
                                          rememberMe = value!;
                                        });
                                      },
                                    ),
                                    Text.rich(
                                      TextSpan(
                                        text: 'I Read and Accept ',
                                        style: TextStyle(fontSize: 12),
                                        children: [
                                          TextSpan(
                                            text:
                                                'Home Service Terms & Conditions',
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.blue,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 65.0),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Have Account?',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w700)),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) {
                                                return Login();
                                              }));
                                            },
                                            child: Text(
                                              AppLocalizations.of(context)
                                                  .login,
                                              style: TextStyle(
                                                decoration:
                                                    TextDecoration.underline,
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
                                              AppLocalizations.of(context)
                                                  .signUp,
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ],
                          ),
                          Column(
                            children: [
                              if (_currentTabIndex == 1) ...[
                                TextField(
                                  controller: _fullNameController,
                                  cursorColor: Colors.blue,
                                  decoration: InputDecoration(
                                    labelStyle: TextStyle(color: Colors.blue),
                                    hintText: 'Full Name',
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                    ),
                                    fillColor: Colors.white,
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 20, horizontal: 20),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      borderSide: BorderSide(
                                        color: Colors.blue,
                                        width: 1,
                                        style: BorderStyle.solid,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
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
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 20, horizontal: 20),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      borderSide: BorderSide(
                                        color: Colors.blue,
                                        width: 1,
                                        style: BorderStyle.solid,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
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
                                  controller: _phoneController,
                                  decoration: InputDecoration(
                                    labelStyle: TextStyle(color: Colors.blue),
                                    hintText: '00000',
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                    ),
                                    fillColor: Colors.white,
                                    filled: true,
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 20, horizontal: 10),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      borderSide: BorderSide(
                                        color: Colors.blue,
                                        width: 1,
                                        style: BorderStyle.solid,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      borderSide: BorderSide(
                                        color: AppColors.stroke2,
                                        width: 1,
                                        style: BorderStyle.solid,
                                      ),
                                    ),
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15, right: 15),
                                      child: DropdownButton<String>(
                                        items: [
                                          DropdownMenuItem<String>(
                                            value: '+966',
                                            child: Row(
                                              children: [
                                                CircleAvatar(
                                                  child: Image.asset(
                                                      'asset/splash.png'),
                                                  radius: 15,
                                                ),
                                                Text("+966")
                                              ],
                                            ),
                                          ),
                                          DropdownMenuItem<String>(
                                            value: '+91',
                                            child: Row(
                                              children: [
                                                CircleAvatar(
                                                  child: Image.asset(
                                                      'asset/splash.png'),
                                                  radius: 15,
                                                ),
                                                Text("+91")
                                              ],
                                            ),
                                          ),
                                          // Add more options as needed
                                        ],
                                        value: '+966', // Default value
                                        onChanged: (value) {},
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
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 20, horizontal: 10),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      borderSide: BorderSide(
                                        color: Colors.blue,
                                        width: 1,
                                        style: BorderStyle.solid,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
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
                                DropdownButtonFormField<String>(
                                  value: _selectedOccupation,
                                  decoration: InputDecoration(
                                    labelStyle: TextStyle(color: Colors.blue),
                                    hintText: 'Select occupation',
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                    ),
                                    fillColor: AppColors.background,
                                    filled: true,
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 20, horizontal: 10),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      borderSide: BorderSide(
                                        color: Colors.blue,
                                        width: 1,
                                        style: BorderStyle.solid,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      borderSide: BorderSide(
                                        color: AppColors.stroke2,
                                        width: 1,
                                        style: BorderStyle.solid,
                                      ),
                                    ),
                                  ),
                                  items: [
                                    DropdownMenuItem(
                                      value: 'Carpenter',
                                      child: Text('Carpenter'),
                                    ),
                                    // Add more DropdownMenuItem for other occupation types
                                  ],
                                  onChanged: (String? value) {
                                    setState(() {
                                      _selectedOccupation = value;
                                    });
                                  },
                                ),
                                SizedBox(height: 16.0),
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
                                    Text.rich(
                                      TextSpan(
                                        text: 'I Read and Accept ',
                                        style: TextStyle(fontSize: 12),
                                        children: [
                                          TextSpan(
                                            text:
                                                'Home Service Terms & Conditions',
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.blue,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 65.0),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Have Account?',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w700)),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) {
                                                return Login();
                                              }));
                                            },
                                            child: Text(
                                              AppLocalizations.of(context)
                                                  .login,
                                              style: TextStyle(
                                                decoration:
                                                    TextDecoration.underline,
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
                                              AppLocalizations.of(context)
                                                  .signUp,
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _prefomLogin() async {
    if (_checkData()) {
      await _register();
    }
  }

  bool _checkData() {
    if (_phoneController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _fullNameController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty &&
        _passwordController.text.length >= 6 &&
        _passwordController.text.length <= 30) {
      return true;
    }
    return false;
  }

  Future<void> _register() async {
    ApiResponse rrespose = await ApiController().Rigester(user1: user);
    if (!rrespose.success!) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Home()));
    }
  }

  User get user {
    User user1 = User();
    user1.name = _fullNameController.text;
    user1.email = _emailController.text;
    user1.password = _passwordController.text;
    user1.phone = _phoneController.text;
    return user1;
  }

// Future<void> registerUser() async {
//   var name = _fullNameController.text;
//   var email = _emailController.text;
//   var password = _passwordController.text;
//   var phone = _phoneController.text;
//
//   var url = Uri.parse('https://studentucas.awamr.com/api/auth/register/user');
//   var body = json.encode(
//       {'name': name, 'email': email, 'password': password, 'phone': phone});
//
//   var response = await http.post(url, body: body, headers: {
//     'Content-Type': 'application/json',
//   });
//
//   if (response.statusCode == 200) {
//     var data = json.decode(response.body);
//     print(data);
//
//     var success = data['success'];
//     var message = data['message'];
//
//     if (success) {
//       print('تم تسجيل المستخدم بنجاح');
//       Navigator.of(context).push(MaterialPageRoute(builder: (context) {
//         return Home();
//       }));
//     } else {
//       print('حدث خطأ أثناء التسجيل: $message');
//     }
//   } else {
//     print('حدث خطأ أثناء التسجيل. الحالة: ${response.statusCode}');
//   }
// }
}
