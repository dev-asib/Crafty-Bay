import 'package:crafty_bay/Presentation/state_holders/otp_verification_controller.dart';
import 'package:get/get.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OTPVerificationController());
  }
}
