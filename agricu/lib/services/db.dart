import 'dart:developer';

import 'package:agricu/models/product.dart';
import 'package:agricu/models/request.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DBMethods {
  final supabase = Supabase.instance;

//  Future<void> insertUser(AppUser user) async {
//     try {
//       await supabase.client.from('USERS').insert(user.toJson());
//       return;
//     } on PostgrestException catch (e) {
//       log('$e');
//       return;
//     }
//   }

  Future uploadProduct(Product product) async {
    try {
      await supabase.client.from('PRODUCTS').insert(product.toJson());
    } catch (e) {
      log('$e');
      throw Exception(e);
    }
  }

  Future<List<Product>> getProducts() async {
    try {
      final res = await supabase.client
          .from('PRODUCTS')
          .select('*,USERS(*)')
          .not('seller_id', 'eq', Null);
      if (res.isEmpty) {
        return [];
      } else {
        return res.map((e) => Product.fromJson(e)).toList();
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future requestToSell(Request request) async {
    try {
      await supabase.client.from('REQUEST').insert(request.toJson());
    } catch (e) {
      log('$e');
      throw Exception(e);
    }
  }
}
