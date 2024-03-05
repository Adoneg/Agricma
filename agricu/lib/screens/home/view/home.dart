import 'package:agricu/models/category_enum.dart';
import 'package:agricu/screens/home/bloc/home_bloc.dart';
import 'package:agricu/themes/colors.dart';
import 'package:agricu/themes/style.dart';
import 'package:agricu/widgets/category_tab.dart';
import 'package:agricu/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.add),
            ),
            extendBody: true,
            body: Stack(children: [
              Column(
                children: [
                  Container(
                    height: 100.h,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(color: lightGreen),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset('assets/images/logo.png'),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.notifications_active,
                                color: Colors.white,
                              ))
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      child: Container(
                    decoration: const BoxDecoration(color: Colors.white),
                    child: Column(
                      children: [
                        const Gap(40),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CategoryTab(
                                active: true,
                                title: CategoryEnum.values[0].name),
                            const Gap(5),
                            CategoryTab(
                                active: false,
                                title: CategoryEnum.values[1].name),
                            const Gap(5),
                            const CategoryTab(
                                active: false, title: 'Dry Fruits')
                          ],
                        ),
                        Expanded(
                            child: Container(
                          child: ListView.separated(
                              separatorBuilder: (context, index) =>
                                  const Gap(25),
                              itemCount: state.productSection!.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            state.productSection![index].title!,
                                            style: AppStyles.title
                                                .copyWith(fontSize: 18),
                                          ),
                                          const Gap(20),
                                          Text(
                                            '(${state.productSection![index].discount}% off)',
                                            style: AppStyles.labelStyle
                                                .copyWith(
                                                    color: lightGreen,
                                                    fontSize: 14),
                                          )
                                        ],
                                      ),
                                      const Gap(10),
                                      Text(
                                        state.productSection![index]
                                            .description!,
                                        style: AppStyles.labelStyle,
                                      ),
                                      const Gap(20),
                                      SizedBox(
                                        height: 160.h,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: ListView.separated(
                                            separatorBuilder:
                                                (context, index) =>
                                                    const Gap(5),
                                            scrollDirection: Axis.horizontal,
                                            itemCount: state
                                                .productSection![index]
                                                .products!
                                                .length,
                                            itemBuilder: (context, index2) {
                                              return ProductCard(
                                                  product: state
                                                      .productSection![index]
                                                      .products![index2]);
                                            }),
                                      )
                                    ],
                                  ),
                                );
                              }),
                        ))
                      ],
                    ),
                  ))
                ],
              ),
              Positioned(
                top: 80.h,
                left: 15,
                right: 15,
                child: Container(
                  height: 40,
                  width: 340.w,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ]),
                  child: Center(
                    child: TextField(
                      onChanged: (text) {},
                      decoration: const InputDecoration(
                          hintText: 'Search',
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          contentPadding: EdgeInsets.only(left: 40.0),
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none)),
                    ),
                  ),
                ),
              )
            ]),
          );
        },
      ),
    );
  }
}
