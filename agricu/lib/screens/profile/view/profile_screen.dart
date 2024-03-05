import 'package:agricu/themes/colors.dart';
import 'package:agricu/themes/style.dart';
import 'package:agricu/widgets/profile_list_tile.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          centerTitle: true,
          title: Text(
            "Profile",
            style: AppStyles.title.copyWith(fontSize: 20),
          ),
        ),
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(50)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      'assets/images/tropicana.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            Text(
              "Victor Adoneg",
              style: AppStyles.regular.copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              "hey@gmail.com",
              style: AppStyles.regular.copyWith(
                fontSize: 12,
              ),
            ),
            ProfileListTile(
              leadingIcon: Icons.favorite_outline,
              title: "Favourites",
              onPressed: () {},
            ),
            ProfileListTile(
              leadingIcon: Icons.mode_edit_outlined,
              title: "Request to sell",
              color: brown,
              onPressed: () {},
            ),
            ProfileListTile(
              leadingIcon: Icons.history,
              title: "Order History",
              onPressed: () {},
            ),
            ProfileListTile(
              leadingIcon: Icons.payment,
              title: "Payment Details",
              onPressed: () {},
            ),
            ProfileListTile(
              leadingIcon: Icons.settings,
              title: "Settings",
              onPressed: () {},
            ),
            ProfileListTile(
              leadingIcon: Icons.logout,
              title: "Logout",
              onPressed: () {},
            ),
          ],
        ));
  }
}
