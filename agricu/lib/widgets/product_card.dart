import 'package:agricu/constants.dart';
import 'package:agricu/models/product.dart';
import 'package:agricu/screens/home/bloc/home_bloc.dart';
import 'package:agricu/screens/product_details/view/product_details.dart';
import 'package:agricu/themes/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({super.key, required this.product});
  final Product product;
  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ProductDetails(product: widget.product)));
          },
          child: SizedBox(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Stack(
                children: [
                  SizedBox(
                    height: 120.h,
                    width: 150.w,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: widget.product.image == null
                          ? Image.asset('assets/images/agricma_logo.png')
                          : Image.network(
                              widget.product.image!,
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                            child: IconButton(
                          onPressed: () {
                            BlocProvider.of<HomeBloc>(context).add(
                                OnToggleFavourites(product: widget.product));
                          },
                          icon: state.favourites
                                  .where((element) =>
                                      element.product!.productId ==
                                      widget.product.productId)
                                  .isNotEmpty
                              ? const Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                  size: 20,
                                )
                              : const Icon(
                                  Icons.favorite_border,
                                  color: Colors.amber,
                                  size: 20,
                                ),
                        )),
                      ),
                    ),
                  )
                ],
              ),
              const Gap(10),
              RatingBar.builder(
                itemSize: 15,
                initialRating: widget.product.stars ?? 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  //print(rating);
                },
              ),
              const Gap(5),
              Text(
                widget.product.name ?? 'Great food',
                style: AppStyles.labelStyle,
              ),
              const Gap(5),
              Text(
                "XAF ${formatPrice(widget.product.price!)}/${widget.product.priceQuantityRatio}",
                style: AppStyles.labelStyle.copyWith(fontSize: 12),
              ),
            ]),
          ),
        );
      },
    );
  }
}
