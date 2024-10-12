import 'package:crafty_bay/Presentation/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerificationForm extends StatelessWidget {
  const OtpVerificationForm({
    super.key,
    required TextEditingController otpTEController,
  }) : _otpTEController = otpTEController;

  final TextEditingController _otpTEController;

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      length: 6,
      animationType: AnimationType.fade,
      keyboardType: TextInputType.number,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(5),
        fieldHeight: 50,
        fieldWidth: 40,
        activeFillColor: Colors.white,
        selectedFillColor: Colors.white,
        selectedColor: Colors.green,
        inactiveFillColor: Colors.white,
        inactiveColor: AppColors.themeColor,
      ),
      animationDuration: const Duration(milliseconds: 300),
      backgroundColor: Colors.transparent,
      enableActiveFill: true,
      controller: _otpTEController,
      appContext: context,
    );
  }
}