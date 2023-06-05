import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width / 4, size.height - 20, size.width / 2, size.height - 5);
    path.quadraticBezierTo(
        3 * size.width / 4, size.height, size.width, size.height - 30);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class More extends StatefulWidget {
  const More({Key? key}) : super(key: key);

  @override
  State<More> createState() => _MoreState();
}

class _MoreState extends State<More> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          ClipPath(
            clipper: CustomCurveClipper(),
            child: Container(
              width: double.infinity,
              height: 100,
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
              child: Center(
                child: Text('More',
                    style: TextStyle(fontSize: 24,color: Colors.white,
                        fontWeight: FontWeight.w500)),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            title: Text('Change Password'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            title: Text('FAQ\'s'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            title: Text('About App'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            title: Text('Terms & Conditions'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            title: Text('Privacy Policy'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            title: Text('Rate App'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            title: Text('Delete Account'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
    );
  }
}
