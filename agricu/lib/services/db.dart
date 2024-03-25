import 'dart:developer';

import 'package:agricu/enums/category_enum.dart';
import 'package:agricu/models/favourites.dart';
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

  Future addFavourite(Favourite favourite) async {
    try {
      await supabase.client.from('FAVOURITES').insert(favourite.toJson());
    } catch (e) {
      log('$e');
    }
  }

  Future removeFavourite(String userId, int productId) async {
    try {
      await supabase.client
          .from('FAVOURITES')
          .delete()
          .eq('user_id', userId)
          .eq('product_id', productId);
    } catch (e) {
      log('$e');
    }
  }

  Future<List<Favourite>> getFavourites(String id) async {
    try {
      final favourites = await supabase.client
          .from('FAVOURITES')
          .select('*, PRODUCTS(*)')
          .eq('user_id', id);

      return favourites.map((e) => Favourite.fromJson(e)).toList();
    } catch (e) {
      log('$e');
      throw Exception(e);
    }
  }

  Future<List<Product>> getProducts(CategoryEnum category) async {
    try {
      final PostgrestFilterBuilder<List<Map<String, dynamic>>>? query;

      if (category != CategoryEnum.all) {
        query = supabase.client
            .from('PRODUCTS')
            .select('*,USERS(*)')
            .not('seller_id', 'eq', Null)
            .eq('category', category.toDBString());
      } else {
        query = supabase.client
            .from('PRODUCTS')
            .select('*,USERS(*)')
            .not('seller_id', 'eq', Null);
      }
      final res = await query;
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
