import 'package:crafty_bay/Presentation/ui/screens/auth/complete_profile_screen.dart';
import 'package:crafty_bay/Presentation/ui/screens/auth/email_verification_screen.dart';
import 'package:crafty_bay/Presentation/ui/screens/auth/otp_verification_screen.dart';
import 'package:crafty_bay/Presentation/ui/screens/home_screen.dart';
import 'package:crafty_bay/Presentation/ui/screens/splash_screen.dart';
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
      ];
}
