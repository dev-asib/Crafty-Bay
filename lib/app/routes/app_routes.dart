import 'package:crafty_bay/Presentation/ui/screens/auth/complete_profile_screen.dart';
import 'package:crafty_bay/Presentation/ui/screens/auth/email_verification_screen.dart';
import 'package:crafty_bay/Presentation/ui/screens/auth/otp_verification_screen.dart';
import 'package:crafty_bay/Presentation/ui/screens/cart_screen.dart';
import 'package:crafty_bay/Presentation/ui/screens/category_list_screen.dart';
import 'package:crafty_bay/Presentation/ui/screens/home_screen.dart';
import 'package:crafty_bay/Presentation/ui/screens/main_bottom_nav_screen.dart';
import 'package:crafty_bay/Presentation/ui/screens/product_details_screen.dart';
import 'package:crafty_bay/Presentation/ui/screens/product_list_screen.dart';
import 'package:crafty_bay/Presentation/ui/screens/splash_screen.dart';
import 'package:crafty_bay/Presentation/ui/screens/wish_list_screen.dart';
import 'package:crafty_bay/app/routes/routes_name.dart';
import 'package:get/get.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
          name: RoutesName.splashScreen,
          page: () => const SplashScreen(),
        ),
        GetPage(
          name: RoutesName.emailVerificationScreen,
          page: () => const EmailVerificationScreen(),
        ),
        GetPage(
          name: RoutesName.otpVerificationScreen,
          page: () => const OTPVerificationScreen(),
        ),
        GetPage(
          name: RoutesName.completeProfileScreen,
          page: () => const CompleteProfileScreen(),
        ),
    GetPage(
      name: RoutesName.homeScreen,
      page: () => const HomeScreen(),
    ),
    GetPage(
      name: RoutesName.categoryListScreen,
      page: () => const CategoryListScreen(),
    ),
    GetPage(
      name: RoutesName.productListScreen,
      page: () => const ProductListScreen(),
    ),
    GetPage(
      name: RoutesName.mainBottomNavScreen,
      page: () => const MainBottomNavScreen(),
    ),
    GetPage(
      name: RoutesName.cartScreen,
      page: () => const CartScreen(),
    ),
    GetPage(
      name: RoutesName.wishListScreen,
      page: () => const WishListScreen(),
    ),
    GetPage(
      name: RoutesName.productDetailsScreen,
      page: () => const ProductDetailsScreen(),
    ),
      ];
}
