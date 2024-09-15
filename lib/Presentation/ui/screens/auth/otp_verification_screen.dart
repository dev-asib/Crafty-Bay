import 'package:crafty_bay/Presentation/state_holders/otp_verification_controller.dart';
import 'package:crafty_bay/Presentation/ui/utils/app_colors.dart';
import 'package:crafty_bay/Presentation/ui/widgets/app_logo_widget.dart';
import 'package:crafty_bay/app/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPVerificationScreen extends StatefulWidget {
  const OTPVerificationScreen({super.key});

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  final OTPVerificationController otpVerificationController =
      Get.put(OTPVerificationController());

  final TextEditingController _otpTEController = TextEditingController();

  @override
  void initState() {
    super.initState();
    otpVerificationController.startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const SizedBox(height: 82),
              const AppLogoWidget(),
              const SizedBox(height: 24),
              Text(
                "Enter OTP Code",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 8),
              Text(
                "A 4 digit otp code has been sent to email.",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.black45,
                    ),
              ),
              const SizedBox(height: 24),
              PinCodeTextField(
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
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _onTapNextScreen,
                child: const Text('Next'),
              ),
              const SizedBox(height: 16),
              GetBuilder<OTPVerificationController>(
                builder: (otpVerificationController) {
                  return RichText(
                    text: TextSpan(
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(color: AppColors.greyColor),
                      text: "This code will expire in ",
                      children: [
                        TextSpan(
                          text: otpVerificationController.remainingSeconds
                              .toString(),
                          style: const TextStyle(color: AppColors.themeColor),
                        ),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(height: 8),
              GetBuilder<OTPVerificationController>(
                builder: (otpVerificationController) {
                  return TextButton(
                    onPressed: otpVerificationController.remainingSeconds > 0
                        ? null
                        : () => otpVerificationController.resetTimer(),
                    child: Text(
                      "Resend Code",
                      style: TextStyle(
                        color: otpVerificationController.remainingSeconds > 0
                            ? Colors.grey
                            : null,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onTapNextScreen() {
    Get.toNamed(RoutesName.completeProfileScreen);
  }

  @override
  void dispose() {
    otpVerificationController.onClose();
    super.dispose();
  }
}
