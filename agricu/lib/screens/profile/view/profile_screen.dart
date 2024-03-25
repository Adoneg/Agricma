import 'package:agricu/enums/account_type_enum.dart';
import 'package:agricu/enums/loading_state_enum.dart';
import 'package:agricu/routes/route_names.dart';
import 'package:agricu/screens/profile/bloc/profile_bloc.dart';
import 'package:agricu/themes/colors.dart';
import 'package:agricu/themes/style.dart';
import 'package:agricu/widgets/profile_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state.signOutState == LoadingState.success) {
          context.replace(RoutePath.login);
        }
      },
      builder: (context, state) {
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
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50)),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: state.currentUser?.picture == null
                              ? Image.asset(
                                  'assets/images/tropicana.jpg',
                                  fit: BoxFit.cover,
                                )
                              : Image.network(
                                  state.currentUser!.picture!,
                                  fit: BoxFit.cover,
                                )),
                    ),
                  ],
                ),
                Text(
                  state.currentUser!.name ?? "",
                  style:
                      AppStyles.regular.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  state.currentUser!.email ?? "",
                  style: AppStyles.regular.copyWith(
                    fontSize: 12,
                  ),
                ),
                ProfileListTile(
                  color: Colors.red,
                  leadingIcon: Icons.favorite_outline,
                  title: "Favourites",
                  onPressed: () {},
                ),
                state.currentUser!.accountType == AccountType.seller ||
                        state.currentUser!.hasApplied == true
                    ? ProfileListTile(
                        leadingIcon: Icons.mode_edit_outlined,
                        title: "My Products",
                        color: brown,
                        onPressed: () {
                          context.goNamed(RoutePath.requestToSell);
                        },
                      )
                    : ProfileListTile(
                        leadingIcon: Icons.mode_edit_outlined,
                        title: "Request to sell",
                        color: brown,
                        onPressed: () {
                          context.goNamed(RoutePath.requestToSell);
                        },
                      ),
                ProfileListTile(
                  color: Colors.blue,
                  leadingIcon: Icons.history,
                  title: "Order History",
                  onPressed: () {},
                ),
                ProfileListTile(
                  color: darkGreen,
                  leadingIcon: Icons.payment,
                  title: "Payment Details",
                  onPressed: () {},
                ),
                ProfileListTile(
                  color: const Color(0xff008080),
                  leadingIcon: Icons.settings,
                  title: "Settings",
                  onPressed: () {},
                ),
                ProfileListTile(
                  color: const Color(0xff333333),
                  leadingIcon: Icons.logout,
                  title: "Logout",
                  onPressed: () {
                    context.read<ProfileBloc>().add(OnLogout());
                  },
                ),
              ],
            ));
      },
    );
  }
}
