import 'package:agricu/constants.dart';
import 'package:agricu/models/favourites.dart';
import 'package:agricu/screens/home/bloc/home_bloc.dart';
import 'package:agricu/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../themes/style.dart';

class FavouriteItem extends StatelessWidget {
  const FavouriteItem({super.key, required this.favourite});
  final Favourite favourite;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Container(
            height: 100,
            width: 120,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: favourite.product?.image == null
                    ? Image.asset(
                        "assets/images/tropicana.jpg",
                        fit: BoxFit.cover,
                      )
                    : Image.network(
                        favourite.product!.image!,
                        fit: BoxFit.cover,
                      )),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: SizedBox(
                          child: Text(
                            favourite.product?.name ?? "",
                            style: AppStyles.regular,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          BlocProvider.of<HomeBloc>(context)
                              .add(OnRemoveFavourite(favourite: favourite));
                        },
                        child: const Icon(
                          Icons.delete_outline_outlined,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.timer_outlined,
                        size: 20,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "20 - 25 min",
                        style: AppStyles.regular.copyWith(fontSize: 12),
                      )
                    ],
                  ),
                  Text(
                    "FCFA ${formatPrice(favourite.product!.price!)}",
                    style: AppStyles.regular,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: SizedBox(
                          child: RatingBar.builder(
                            ignoreGestures: true,
                            itemSize: 15,
                            initialRating: 3,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 1.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              //print(rating);
                            },
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: const Icon(
                          Icons.shopping_cart,
                          color: brown,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
