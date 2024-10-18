import 'package:crafty_bay/Presentation/ui/utils/regex_patterns.dart';

class OtpValidator {
  static bool validateOtp(String otp) {
    return RegexPatterns.otpRegExp.hasMatch(otp);
  }
}
