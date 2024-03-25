import 'package:agricu/screens/home/bloc/home_bloc.dart';
import 'package:agricu/themes/style.dart';
import 'package:agricu/widgets/favourite_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
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
                itemCount: state.favourites.length,
                itemBuilder: (context, index) {
                  return FavouriteItem(favourite: state.favourites[index]);
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    height: 10,
                  );
                },
              ),
            ));
      },
    );
  }
}
