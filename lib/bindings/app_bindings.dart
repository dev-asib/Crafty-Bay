import 'package:crafty_bay/Presentation/state_holders/category_list_controller.dart';
import 'package:crafty_bay/Presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:crafty_bay/Presentation/state_holders/new_product_list_controller.dart';
import 'package:crafty_bay/Presentation/state_holders/otp_verification_controller.dart';
import 'package:crafty_bay/Presentation/state_holders/popular_product_list_controller.dart';
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
    Get.put(NetworkCaller(loggerServices: Get.find<LoggerService>()));

    /// State holders
    Get.lazyPut(() => MainBottomNavController());
    Get.lazyPut(() => OTPVerificationController());
    Get.lazyPut(() => SliderListController());
    Get.lazyPut(() => CategoryListController());
    Get.lazyPut(() => NewProductListController());
    Get.lazyPut(() => PopularProductListController());
    Get.lazyPut(() => SpecialProductListController());
  }
}
