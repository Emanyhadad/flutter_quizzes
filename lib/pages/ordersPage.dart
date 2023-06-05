import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quizzes/pojo/AppColors.dart';

import '../controller/api_controller.dart';
import '../pojo/data.dart';
import '../pojo/work.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: AppColors.Screen2,
      appBar: AppBar(title: Text('Item Details'),centerTitle: true,backgroundColor: Colors.blue),
      body: Padding(
        padding: EdgeInsets.only(top: 16,bottom: 16),
        child: FutureBuilder<List<Work>>(
          future: ApiController().getAllWork(),
          builder: (context, snapshot) {
            print(snapshot.data);
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator());
            }
            else if(snapshot.connectionState == ConnectionState.done && snapshot.data != null && snapshot.data!.isNotEmpty){
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) => Column(
                  children: [
                    Container(
                      color: Colors.white,
                      width: double.infinity,
                      padding: EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${snapshot.data![index].description!}',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                // 'Date: ${snapshot.data![index].creationDate}',
                                '05/06/2023',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16,),
                          Row(children: [Text(
                            'Service Type :',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                            Text(
                              '${snapshot.data![index].name!}',
                              style: TextStyle(
                                fontSize: 14,
                                color: AppColors.Screen,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                          ],)
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    // ListTile(
                    //   title: Text('${snapshot.data![index].jobTitle!}'),
                    //   subtitle: Text('${snapshot.data![index].bio!}'),
                    // ),
                  ],
                ),
              );
            }else {
              return Center(
                child: Text("no data found"),
              );
            }

          },
        ),
      ),


    );
  }
}
