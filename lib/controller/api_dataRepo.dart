

import 'package:flutter_quizzes/controller/api_controller.dart';
import 'package:flutter_quizzes/pojo/product.dart';
import 'package:flutter_quizzes/pojo/work.dart';

class DataRepo {
  ApiController apiController = ApiController();

  Future<List<Product>> getAllProduct() async {
    List<Product> product = [];
    var value = await apiController.getAllProduct();

    if (value["success"]) {
      value["data"].forEach((e) {
        product.add(Product.fromJson(e));
      });
    }

    return product;
  }




}