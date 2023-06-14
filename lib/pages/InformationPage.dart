
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../controller/api_controller.dart';
import '../pojo/ApiResponse.dart';
import '../pojo/AppColors.dart';
import '../pojo/order.dart';
import '../pojo/work.dart';
import 'home.dart';
import 'mainpage.dart';
import 'morePage.dart';

class InformationPage extends StatefulWidget {
  final String text;

  InformationPage({required this.text});

  @override
  State<InformationPage> createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage>
    with TickerProviderStateMixin {
  List<String> selectedImages = [];
  List<http.MultipartFile> filess = [];
  final ImagePicker picker = ImagePicker();

  XFile? file;
  late TextEditingController _phoneController;
  late TextEditingController _problemController;
  late TextEditingController _locationController;

  @override
  void initState() {
    super.initState();
    _phoneController = TextEditingController();
    _problemController = TextEditingController();
    _locationController = TextEditingController();
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _problemController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 80),
        child: ClipPath(
          clipper: CustomCurveClipper(),
          child: Container(
            width: double.infinity,
            height: 80,
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
              child: Text(
                'Smith',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        border: Border.all(
                          color: Colors.blue,
                          width: .5,
                          style: BorderStyle.solid,
                        ),
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: SvgPicture.asset(
                              'asset/profile.svg',
                            ),
                          ),
                          SizedBox(width: 10),
                          Text('Image Problem'),
                        ],
                      ),
                    ),
                    onTap: () async {
                      List<XFile>? images =
                          await ImagePicker().pickMultiImage();
                      if (images != null) {
                        for (XFile image in images) {
                          http.MultipartFile file =
                              await http.MultipartFile.fromPath(
                            "image",
                            image.path,
                          );
                          selectedImages.add(file.toString() as String);
                          print(image.path);
                        }
                      }
                    },
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Image must be no more than 2 MB Max 5 Image',
                    style: TextStyle(
                      fontSize: 11,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: 40.0),
                  TextField(
                    controller: _problemController,
                    cursorColor: Colors.blue,
                    maxLines: 5,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.blue),
                      hintText: 'More Details About Problem',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                      fillColor: Colors.white,
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
                  SizedBox(height: 25.0),
                  TextField(
                    controller: _locationController,
                    cursorColor: Colors.blue,
                    maxLines: 5,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.blue),
                      hintText: 'More Details About Location',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                      fillColor: Colors.white,
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
                  SizedBox(height: 25.0),
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
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: DropdownButton<String>(
                          items: [
                            DropdownMenuItem<String>(
                              value: '+966',
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    child: Image.asset('asset/splash.png'),
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
                                    child: Image.asset('asset/splash.png'),
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
                  SizedBox(height: 25.0),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // _createOrder();
                        String token = GetStorage().read('token');
                        print(token);
                        Map<String, String> data = {
                          "work_id": '1',
                          'details': _problemController.text,
                          'details_address': _locationController.text,
                          'phone': _phoneController.text,
                          'lat': '1234.11',
                          'Long': '123423.21',
                        };
                        if (selectedImages.isNotEmpty && token != null) {
                          print('init');
                          print(data.toString());
                          print(selectedImages[0]);

                          ApiController().post_data(
                            token,
                            data,
                            filess,
                            'photos[]',
                          );

                        } else {
                          print("photo null");
                        }
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SuccesOrder(),
                          ),
                        );
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.black,
                        ),
                      ),
                      child: Text(
                        'Add Order',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(widget.text),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

// Future<void> _createOrder() async {
//   // if (_checkData()) {
//   await _create();
//   // }
// }

// Future<void> _create() async {
//   // String? phone = _phoneController.text;
//   // String? problem = _problemController.text;
//   // String? location = _locationController.text;
//   //
//   // if (phone != null && problem != null && location != null) {
//   //   // OrderResponse order = OrderResponse();
//   //   // order.details = problem;
//   //   // order.workId = 1;
//   //   // order.detailsAddress = location;
//   //   // order.phone = phone;
//   //
//   //   ApiResponse response = await ApiController().createOrder(orderResponse: order) as ApiResponse;
//   //   if (response.success != null && !response.success!) {
//   //     print('success');
//   //     Navigator.pushReplacement(
//   //       context,
//   //       MaterialPageRoute(builder: (context) => Home()),
//   //     );
//   //   }
//   // }
//
//   ApiResponse response = await ApiController().createOrder(orderResponse: order) ;
//   print(response.data);
//   if (response.success != null && !response.success!) {
//     print('success');
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(builder: (context) => Home()),
//     );
//   }
// }
// Future<void> _create() async {
//   String? phone = _phoneController.text;
//   String? problem = _problemController.text;
//   String? location = _locationController.text;
//
//   if (phone != null && problem != null && location != null) {
//     OrderResponse order = OrderResponse();
//     order.details = problem;
//     order.workId = 1;
//     order.detailsAddress = location;
//     order.phone = phone;
//     order.id = 377;
//     order.userId = 362;
//     order.deliveryId = null;
//     order.lat = '234.1';
//     order.long = '23423.2';
//     order.status = 0;
//     order.createdAt = '2023-06-05T20:54:59.000000Z';
//     order.updatedAt = '2023-06-05T20:54:59.000000Z';
//     order.photoOrder = [];
//     order.work = Work(
//       name: 'نجار',
//       id: 1,
//     );
//
//     ApiResponse response = await ApiController().createOrder(orderResponse: order);
//     print(response.data);
//     if (response.success != null && !response.success!) {
//       print('success');
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => SuccesOrder()),
//       );
//     }
//   }
// }
// OrderResponse get order {
//   OrderResponse order = OrderResponse();
//   order.id = 1;
//   order.userId = 2;
//   order.deliveryId = 3;
//   order.workId = 4;
//   order.details = 'Sample details';
//   order.detailsAddress = 'Sample address';
//   order.lat = '12.3456';
//   order.long = '78.9101';
//   order.phone = '1234567890';
//   order.status = 5;
//   order.createdAt = '2023-06-05';
//   order.updatedAt = '2023-06-05';
//   order.photoOrder = [
//     PhotoOrder(
//       id: 1,
//       photo: 'photo1.jpg',
//       orderId: 1,
//       createdAt: '2023-06-05',
//       updatedAt: '2023-06-05',
//     ),
//     PhotoOrder(
//       id: 2,
//       photo: 'photo2.jpg',
//       orderId: 1,
//       createdAt: '2023-06-05',
//       updatedAt: '2023-06-05',
//     ),
//   ];
//   order.work = Work(
//     name: widget.text,
//   );
//   return order;
// }

// void submitOrder() {
//   OrderResponse order = createOrder() as OrderResponse;
//   ApiController.createOrder(order).then((response) {
//     if (response != null) {
//       // Handle the successful order creation
//       print('Order created successfully');
//     } else {
//       // Handle the error case
//       print('Failed to create order');
//     }
//   }).catchError((error) {
//     // Handle any exceptions during the API call
//     print('Error creating order: $error');
//   });
// }
//
// Future<OrderResponse?> createOrder() async {
//   OrderResponse order = OrderResponse();
//   order.details = _problemController.text;
//   order.phone = _phoneController.text;
//   order.userId = 377;
//   order.deliveryId = null;
//   order.workId = 1;
//   order.detailsAddress = _locationController.text;
//   order.lat = '234.1';
//   order.long = '23423.2';
//   order.photoOrder = widget.selectedImages.map((imagePath) {
//     return PhotoOrder(photo: imagePath);
//   }).toList();
//
//   order.work = Work(name: widget.text, id: 1);
//
//   try {
//     final response = await ApiController.createOrder(order);
//     if (response != null) {
//       return response;
//     } else {
//       throw Exception('Failed to create order');
//     }
//   } catch (e) {
//     throw Exception('Error creating order: $e');
//   }
}

class SuccesOrder extends StatefulWidget {
  @override
  State<SuccesOrder> createState() => _SuccesOrderState();
}

class _SuccesOrderState extends State<SuccesOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'asset/illustration.png', // Replace with your image path
              width: 200,
              height: 200,
            ),
            SizedBox(height: 20),
            Text(
              'Success!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Your addition was successful.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Go to Home'),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage0()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
