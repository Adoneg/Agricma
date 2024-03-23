import 'package:agricu/models/product.dart';
import 'package:agricu/themes/colors.dart';
import 'package:agricu/themes/style.dart';
import 'package:agricu/widgets/outline_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key, required this.product});
  final Product product;
  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: lightGreen,
        title: Text(
          'Details',
          style: AppStyles.btn.copyWith(fontSize: 18),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: SizedBox(
                  child: Column(
                    children: [
                      Container(
                        height: 120.h,
                        width: 300.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5)),
                        child: Hero(
                          tag: '${widget.product.productId}',
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: widget.product.image == null
                                  ? Image.asset(
                                      widget.product.image!,
                                      fit: BoxFit.cover,
                                    )
                                  : Image.network(
                                      widget.product.image!,
                                      fit: BoxFit.cover,
                                    )),
                        ),
                      ),
                      const Gap(5),
                      Text(
                        widget.product.name!,
                        style: AppStyles.title,
                      ),
                      const Gap(5),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 300.w,
                          child: Text(
                            '${widget.product.description!} ',
                            maxLines: 10,
                            textAlign: TextAlign.justify,
                            style: AppStyles.labelStyle,
                          ),
                        ),
                      ),
                      const Gap(25),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'XAF ${widget.product.price}',
                    style: AppStyles.labelStyle,
                  ),
                  OutlineButtonWidget(
                    backgroundColor: lightGreen,
                    width: 100.w,
                    child: Text(
                      'Buy Now',
                      style: AppStyles.btn,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
