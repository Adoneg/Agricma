import 'package:agricu/repository/authentication_repository.dart';
import 'package:agricu/repository/user_repository.dart';
import 'package:agricu/routes/navigation_keys.dart';
import 'package:agricu/routes/route_names.dart';
import 'package:agricu/screens/auth/forgot_password/forgot_password_screen.dart';
import 'package:agricu/screens/auth/login/login_screen.dart';
import 'package:agricu/screens/auth/signup/signup_screen.dart';
import 'package:agricu/screens/auth/verify_email.dart';
import 'package:agricu/screens/favourites/view/favourites_screen.dart';
import 'package:agricu/screens/home/view/home.dart';
import 'package:agricu/screens/onboarding/view/onboarding_view.dart';
import 'package:agricu/screens/profile/view/profile_screen.dart';
import 'package:agricu/screens/request_to_sell/view/request_to_sell.dart';
import 'package:agricu/screens/shopping_cart/view/shopping_cart_screen.dart';
import 'package:agricu/screens/upload_product/view/upload_product.dart';
import 'package:agricu/screens/wrapper.dart';
import 'package:agricu/widgets/success.dart';
import 'package:go_router/go_router.dart';

class RouterClass {
  static RouterClass? _instance; // Private instance variable

  final UserRepository userRepository;
  final AuthenticationRepository authenticationRepository;

  RouterClass._({
    required this.authenticationRepository,
    required this.userRepository,
  });

  static RouterClass get instance {
    _instance ??= RouterClass._(
      authenticationRepository: AuthenticationRepository(),
      userRepository: UserRepository(),
    );
    return _instance!;
  }

  GoRouter getRoutes() {
    return GoRouter(
        initialLocation: RoutePath.home,
        navigatorKey: rootNavigatorKey,
        redirect: (context, state) async {
          if (authenticationRepository.onboarded == null ||
              authenticationRepository.onboarded == false) {
            return RoutePath.onboarding;
          }
          final user = authenticationRepository.currentUser;
          if (user == null &&
              !(state.fullPath!.contains(RoutePath.verifyEmail) ||
                  state.fullPath!.contains(RoutePath.login) ||
                  state.fullPath!.contains(RoutePath.signup) ||
                  state.fullPath!.contains(RoutePath.forgotPasswordSub))) {
            return RoutePath.login;
          }

//           // if (state.fullPath != null) {
//           //   return state.fullPath;
//           // }
//
//           if (user != null && state.) {
//             log('redirect runninga');
//             return RoutePath.home;
//           }

          return null;
        },
        routes: [
          GoRoute(
              path: RoutePath.login,
              builder: (context, state) {
                return const LoginScreen();
              },
              routes: [
                GoRoute(
                  name: RoutePath.forgotPasswordSub,
                  path: RoutePath.forgotPasswordSub,
                  builder: (context, state) {
                    return const ForgotPasswordScreen();
                  },
                ),
              ]),
          GoRoute(
              path: RoutePath.signup,
              builder: (context, state) {
                return const SignUpScreen();
              }),
          GoRoute(
              path: RoutePath.onboarding,
              builder: (context, state) {
                return const OnBoarding();
              }),
          GoRoute(
              path: RoutePath.verifyEmail,
              builder: (context, state) {
                return const VerifyEmail();
              }),
          StatefulShellRoute.indexedStack(
              //    parentNavigatorKey: rootNavigatorKey,
              builder: (context, state, navigationShell) {
                return Wrapper(navigationShell: navigationShell);
              },
              branches: [
                StatefulShellBranch(navigatorKey: shellNavigator1Key, routes: [
                  GoRoute(
                      path: RoutePath.home,
                      builder: (context, state) {
                        return const Home();
                      },
                      routes: [
                        GoRoute(
                          name: RoutePath.uploadProduct,
                          path: RoutePath.uploadProduct,
                          builder: (context, state) {
                            return const UploadProduct();
                          },
                        )
                      ]),
                ]),
                StatefulShellBranch(navigatorKey: shellNavigatorKey, routes: [
                  GoRoute(
                    path: RoutePath.shoppingCart,
                    builder: (context, state) {
                      return const ShoppingCartScreen();
                    },
                  ),
                ]),
                StatefulShellBranch(navigatorKey: shellNavigator2Key, routes: [
                  GoRoute(
                    path: RoutePath.favourites,
                    builder: (context, state) {
                      return const FavouriteScreen();
                    },
                  ),
                ]),
                StatefulShellBranch(navigatorKey: shellNavigator3Key, routes: [
                  GoRoute(
                      path: RoutePath.profile,
                      builder: (context, state) {
                        return const ProfileScreen();
                      },
                      routes: [
                        GoRoute(
                            name: RoutePath.requestToSell,
                            parentNavigatorKey: rootNavigatorKey,
                            path: RoutePath.requestToSell,
                            builder: (context, state) {
                              return const RequestToSell();
                            })
                      ]),
                ]),
              ]),
          GoRoute(
              name: 'success',
              path: RoutePath.success,
              builder: (context, state) {
                return Success(
                  message: state.uri.queryParameters['message'] as String,
                  onPressed: () {
                    if (state.uri.queryParameters['message'] ==
                        'Request To Sell Sent Successfully') {
                      context.replace(RoutePath.profile);
                    } else {
                      context.replace(RoutePath.profile);
                    }
                  },
                );
              })
        ]);
  }

  GoRouter get routes => getRoutes();
}
