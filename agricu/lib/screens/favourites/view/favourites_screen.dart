import 'package:agricu/themes/style.dart';
import 'package:agricu/widgets/favourite_item.dart';
import 'package:flutter/material.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          centerTitle: true,
          title: Text(
            "Favourites",
            style: AppStyles.title.copyWith(fontSize: 20),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ListView.separated(
            itemCount: 10,
            itemBuilder: (context, index) {
              return const FavouriteItem();
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 10,
              );
            },
          ),
        ));
  }
}
