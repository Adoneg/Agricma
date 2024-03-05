import 'package:agricu/themes/colors.dart';
import 'package:agricu/themes/style.dart';
import 'package:agricu/widgets/outline_button.dart';
import 'package:agricu/widgets/shopping_cart_item.dart';
import 'package:flutter/material.dart';

class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          centerTitle: true,
          title: Text(
            "Shopping Cart",
            style: AppStyles.title.copyWith(fontSize: 20),
          ),
        ),
        body: Column(
          children: [
            Expanded(
                child: SizedBox(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: ListView.separated(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return const ShoppingCartItem();
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height: 10,
                    );
                  },
                ),
              ),
            )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total (10 items)",
                    style: AppStyles.regular,
                  ),
                  Text(
                    "FCFA 10500",
                    style:
                        AppStyles.regular.copyWith(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: OutlineButtonWidget(
                onPressed: () {},
                width: double.infinity,
                backgroundColor: brown,
                child: Text(
                  "Checkout",
                  style: AppStyles.regular.copyWith(color: Colors.white),
                ),
              ),
            )
          ],
        ));
  }
}
