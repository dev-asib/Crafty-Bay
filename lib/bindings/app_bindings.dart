import 'package:crafty_bay/Presentation/state_holders/add_to_cart_controller.dart';
import 'package:crafty_bay/Presentation/state_holders/auth/auth_controller.dart';
import 'package:crafty_bay/Presentation/state_holders/auth/create_product_review_controller.dart';
import 'package:crafty_bay/Presentation/state_holders/auth/create_profile_controller.dart';
import 'package:crafty_bay/Presentation/state_holders/auth/otp_verification_controller.dart';
import 'package:crafty_bay/Presentation/state_holders/auth/read_profile_controller.dart';
import 'package:crafty_bay/Presentation/state_holders/auth/timer_controller.dart';
import 'package:crafty_bay/Presentation/state_holders/auth/update_profile_controller.dart';
import 'package:crafty_bay/Presentation/state_holders/auth/user_profile_controller.dart';
import 'package:crafty_bay/Presentation/state_holders/category_list_controller.dart';
import 'package:crafty_bay/Presentation/state_holders/auth/email_verification_controller.dart';
import 'package:crafty_bay/Presentation/state_holders/list_product_by_category_controller.dart';
import 'package:crafty_bay/Presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:crafty_bay/Presentation/state_holders/new_product_list_controller.dart';
import 'package:crafty_bay/Presentation/state_holders/popular_product_list_controller.dart';
import 'package:crafty_bay/Presentation/state_holders/product_details_controller.dart';
import 'package:crafty_bay/Presentation/state_holders/product_review_controller.dart';
import 'package:crafty_bay/Presentation/state_holders/slider_list_controller.dart';
import 'package:crafty_bay/Presentation/state_holders/special_product_list_controller.dart';
import 'package:crafty_bay/data/services/logger_service.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    /// Logger setup
    Get.put(Logger());
    Get.put(LoggerService(logger: Get.find<Logger>()));

    /// NetworkCaller with LoggerService
    Get.put(AuthController());
    Get.put(NetworkCaller(
      loggerServices: Get.find<LoggerService>(),
      authController: Get.find<AuthController>(),
    ));

    /// State holders
    Get.put(MainBottomNavController());
    Get.put(TimerController());
    Get.put(SliderListController());
    Get.put(CategoryListController());
    Get.put(NewProductListController());
    Get.put(PopularProductListController());
    Get.put(SpecialProductListController());
    Get.put(ListProductByCategoryController());
    Get.put(ProductDetailsController());
    Get.put(AddToCartController());
    Get.put(EmailVerificationController());
    Get.put(OtpVerificationController());
    Get.put(CreateProfileController());
    Get.put(ReadProfileController());
    Get.put(UserProfileController());
    Get.put(UpdateProfileController());
    Get.put(CreateProductReviewController());
    Get.put(ProductReviewController());
  }
}
