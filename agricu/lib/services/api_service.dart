import 'dart:developer';

import 'package:agricu/models/category.dart';
import 'package:agricu/models/product.dart';
import 'package:agricu/services/base.dart';
import 'package:dio/dio.dart';

class ApiService {
  final dio = Dio();
  Future<List<ProductCategory>> getCategories() async {
    final baseOptions = BaseOptions(
      baseUrl: Base.BASEURL,
      headers: {
        'Bearer': 'products',
        'Authorization': '4unuOrSC.XlE8j7TtYyQI81dlhpGhllrYmxTWjMOU',
      },
    );
    dio.options = baseOptions;
    try {
      final res = await dio.get('/api/cat/');
      final result =
          (res.data as List).map((e) => ProductCategory.fromJson(e)).toList();
      return result;
    } catch (e) {
      log('$e');
      rethrow;
    }
  }

  Future<List<Product>> getProducts(String categoryName) async {
    final baseOptions = BaseOptions(
      baseUrl: Base.BASEURL,
      headers: {
        'cat': categoryName,
        'Bearer': 'products',
        'Authorization': '4unuOrSC.XlE8j7TtYyQI81dlhpGhllrYmxTWjMOU',
      },
    );
    dio.options = baseOptions;
    try {
      final response = await dio.get('/api/prod_cat/');
      final result =
          (response.data as List).map((e) => Product.fromJson(e)).toList();
      return result;
    } catch (e) {
      log('e');

      rethrow;
    }
  }
}
