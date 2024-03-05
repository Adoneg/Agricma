import 'package:agricu/themes/colors.dart';
import 'package:agricu/themes/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ShoppingCartItem extends StatelessWidget {
  const ShoppingCartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        "assets/images/ginger.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Spicy Ginger",
                        style: AppStyles.regular,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.orange,
                            size: 20,
                          ),
                          Text(
                            '4.4',
                            style: AppStyles.regular.copyWith(fontSize: 12),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Icon(
                            Icons.timer_outlined,
                            size: 20,
                          ),
                          Text(
                            "20 - 25 min",
                            style: AppStyles.regular.copyWith(fontSize: 12),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "FCFA 2500",
                    style: AppStyles.regular
                        .copyWith(fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.grey)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.remove_circle_outline,
                            color: brown,
                            size: 25,
                          ),
                        ),
                        Text(
                          "1",
                          style: AppStyles.regular,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.add_circle,
                            color: brown,
                            size: 25,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        Positioned(
          right: 0,
          top: 2,
          child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.delete_outlined,
                size: 30,
              )),
        ),
      ],
    );
  }
}
