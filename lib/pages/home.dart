import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quizzes/controller/api_controller.dart';
import 'package:flutter_quizzes/pojo/data.dart';
import 'package:flutter_quizzes/pojo/product.dart';
import 'package:flutter_quizzes/pojo/work.dart';
import 'package:http/http.dart' as http;

// class Home extends StatefulWidget {
//   @override
//   State<Home> createState() => _HomeState();
// }
//
// class _HomeState extends State<Home> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("home"),
//         automaticallyImplyLeading: false,
//       ),
//       body: FutureBuilder<List<Work>>(
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.connectionState == ConnectionState.done &&
//               snapshot.data!.isNotEmpty && snapshot.data != null) {
//             return ListView.builder(
//               itemBuilder: (context, index) => ListTile(
//                 title: Text(snapshot.data![index].name!),
//                 trailing: Text(snapshot.data![index].description!),
//               ),
//             );
//           } else {
//             return Center(
//               child: Text("No data found"),
//             );
//           }
//         },
//         future: DataRepo().getAllOrder(),
//       ),
//     );
//   }
// }

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Work> works = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('https://studentucas.awamr.com/api/all/works'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        works = List<Work>.from(data.map((item) => Work.fromJson(item)));
      });
    } else {
      print('Failed to fetch data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        automaticallyImplyLeading: false, // Hide the back button

      ),
      body: FutureBuilder<List<data>>(
        future: ApiController().getAllData(),
        builder: (context, snapshot) {
          print(snapshot.data);
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }else if(snapshot.connectionState == ConnectionState.done && snapshot.data != null && snapshot.data!.isNotEmpty){
            return ListView.builder(
              itemCount: snapshot.data!.length,
                itemBuilder: (context, index) => Column(
                  children: [
                    ListTile(
                      title: Text('${snapshot.data![index].firstName!}+${snapshot.data![index].lastName!}'),
                      subtitle: Text(snapshot.data![index].country!),
                    ),
                     Image.network(snapshot.data![index].image!),
                  ],
                ));
          }else {
            return Center(
              child: Text("no data found"),
            );
          }

        },
      ),

    );
  }
}
