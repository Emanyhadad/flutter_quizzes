import 'dart:convert';
import 'dart:io';

import 'package:flutter_quizzes/controller/api_mixin.dart';
import 'package:flutter_quizzes/controller/api_setting.dart';
import 'package:flutter_quizzes/pojo/ApiResponse.dart';
import 'package:flutter_quizzes/pojo/product.dart';
import 'package:flutter_quizzes/pojo/work.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../pojo/data.dart';
import '../pojo/user.dart';

class ApiController with ApiMixin {
  Future<dynamic> getAllProduct() async {
    List<Product> list = [];
    Uri uri = Uri.parse(ApiSetting.get_all_product);
    http.Response response = await http.get(uri);

    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      body.forEach((e) {
        list.add(Product.fromJson(e));
      });
      return list;
    }
  }

  getProductDetails(id) async {
    Uri uri = Uri.parse(ApiSetting.get_all_product.replaceFirst("{id}", id));
    http.Response response = await http.get(uri);

    if (response.statusCode == 200 || response.statusCode == 401) {
      return json.decode(response.body);
    }
  }

  getUserPosts(userId) async {
    var params = {"userId": userId};
    Uri uri = Uri.https("jsonplaceholder.typicode.com", "posts", params);
    http.Response response = await http
        .get(uri, headers: {HttpHeaders.contentTypeHeader: 'application/json'});

    if (response.statusCode == 200 || response.statusCode == 401) {
      return json.decode(response.body);
    }
  }

  Future<List<Work>> getAllOrders1() async {
    List<Work> list = [];
    Uri uri = Uri.parse(ApiSetting.getAllOrders);
    http.Response response = await http.get(uri);

    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      if (body is List) {
        for (var item in body) {
          list.add(Work.fromJson(item));
        }
      }
    } else {
      // Handle other possible status codes (e.g., 401) here
      throw Exception('Failed to fetch orders: ${response.statusCode}');
    }

    return list;
  }

  Future<List<Work>> getAllOrders() async {
    List<Work> list = [];
    //url
    Uri uri = Uri.parse("https://studentucas.awamr.com/api/all/works");
    //method
    http.Response response = await http.get(uri);

    //response
    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      body.forEach((e) {
        list.add(Work.fromJson(e));
      });
    }
    return list;
  }

  Future<List<data>> getAllData() async {
    List<data> list = [];
    Uri uri = Uri.parse("http://demo-api.mr-dev.tech/api/users");
    http.Response response = await http.get(uri);

    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      body.toString();
      print(body.toString());
      body["data"].forEach((e) {
        print(body);
        list.add(data.fromJson(e));
      });
    }
    return list;
  }
  Future<List<data>> getAllData1() async {
    List<data> list = [];
    Uri uri = Uri.parse("http://demo-api.mr-dev.tech/api/users");

    try {
      http.Response response = await http.get(uri);

      if (response.statusCode == 200) {
        var body = json.decode(response.body);
        if (body is List) {
          print(body[0]);
          body.forEach((e) {
            list.add(data.fromJson(e));
          });
        }
      }
    } catch (e) {
      print("Error: $e");
    }

    return list;
  }













  Future<ApiResponse> register({required User user}) async {
    Uri url = Uri.parse(ApiSetting.postRegester);
    http.Response response = await http.post(url,
        body: user.toJsonRegister(),
        headers: {HttpHeaders.contentTypeHeader: 'application/json'});

    if (response.statusCode == 201 || response.statusCode == 400) {
      var jsonResponse = jsonDecode(response.body);
      ApiResponse api_response = ApiResponse.fromJson(jsonResponse);

      return api_response;
    }
    return failedResponse;
  }

  Future<ApiResponse> resetPassword({email, pass, repass, code}) async {
    Uri uri = Uri.parse(ApiSetting.postLogin);
    var map = {
      'password_confirmation': repass,
      'password': pass,
      'code': code,
      'email': email
    };

    http.Response response = await http.post(uri,
        body: map,
        headers: {HttpHeaders.contentTypeHeader: 'application/json'});

    if (response.statusCode == 200 || response.statusCode == 400) {
      var jsonResponse = jsonDecode(response.body);
      ApiResponse api_response = ApiResponse.fromJson(jsonResponse);
      return api_response;
    }
    return failedResponse;
  }

  Future<ApiResponse> forgetPassword({email}) async {
    Uri uri = Uri.parse(ApiSetting.postLogin);
    var map = {'email': email};

    http.Response response = await http.post(uri,
        body: map,
        headers: {HttpHeaders.contentTypeHeader: 'application/json'});

    if (response.statusCode == 200 || response.statusCode == 400) {
      var jsonResponse = jsonDecode(response.body);
      ApiResponse api_response = ApiResponse.fromJson(jsonResponse);

      return api_response;
    }
    return failedResponse;
  }

  Future<ApiResponse> Login({email, password}) async {

    Uri url = Uri.parse(ApiSetting.postLogin);
    var map = {"email": email, "password": password};

    http.Response response = await http.post(
      url,
      body: map,
      // headers: {HttpHeaders.contentTypeHeader: 'application/json'}
    );
    print(response.body);

    if (response.statusCode == 200 || response.statusCode == 400) {
      var jsonResponse = jsonDecode(response.body);
      ApiResponse rrespose = ApiResponse.fromJson(jsonResponse);
      if (response.statusCode == 200) {
        if (rrespose.data != null) {
          GetStorage().write("token", rrespose.data!.token);
          GetStorage().write("email", rrespose.data!.email);
          GetStorage().write("name", rrespose.data!.name);
        }
      }
      return rrespose;
    }
    return failedResponse;
  }
  Future<ApiResponse> Rigester({required User user1}) async {
    Uri url = Uri.parse(ApiSetting.postRegester);
      print(user1.toJsonRegister());
    http.Response response = await http.post(
      url,
      body: user1.toJsonRegister(),
      // headers: {HttpHeaders.contentTypeHeader: 'application/json'}
    );

    if (response.statusCode == 201 || response.statusCode == 400) {
      var jsonResponse = jsonDecode(response.body);
      ApiResponse rrespose = ApiResponse.fromJson(jsonResponse);
      return rrespose;
    }
    return failedResponse;
  }


}
