import 'package:flutter/material.dart';
import 'package:flutter_quizzes/SharedPreferencesController.dart';
import 'package:flutter_quizzes/home.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool rememberMe = false;
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Login"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: "Username",
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Checkbox(
                  value: rememberMe,
                  onChanged: (value) {
                    setState(() {
                      rememberMe = value!;
                    });
                  },
                ),
                Text("Remember me"),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                SharedPreferencesController c = SharedPreferencesController();
                await c.getInit();
                c.setData(key: "login", value: rememberMe);

                if (rememberMe) {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                    return Home();
                  }));
                }
              },
              child: Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
