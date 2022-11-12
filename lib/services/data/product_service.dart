import 'dart:convert';

import 'package:cross_fund/domain/models/product_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ProductService extends GetxService {
  static ProductService get to => Get.find();

  List<ProductModel> list = [];

  Future<ProductService> init() async {
    try {
      final jsonString =
          await rootBundle.loadString("assets/data/product.json");
      final jsonDecoded = jsonDecode(jsonString) as Map<String, dynamic>;

      final productListMap = jsonDecoded["data"] as List;
      list = productListMap.map((data) {
        return ProductModel.fromJson(data);
      }).toList();
    } catch (e) {
      debugPrint("ProductService:init: $e");
    }
    return this;
  }
}
