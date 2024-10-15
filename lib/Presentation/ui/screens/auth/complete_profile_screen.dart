import 'package:crafty_bay/Presentation/state_holders/auth/create_profile_controller.dart';
import 'package:crafty_bay/Presentation/state_holders/auth/read_profile_controller.dart';
import 'package:crafty_bay/Presentation/ui/utils/app_colors.dart';
import 'package:crafty_bay/Presentation/ui/utils/notification_utils.dart';
import 'package:crafty_bay/Presentation/ui/widgets/auth_header.dart';
import 'package:crafty_bay/Presentation/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:crafty_bay/Presentation/ui/widgets/complete_profile/complete_profile_form.dart';
import 'package:crafty_bay/app/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _cityTEController = TextEditingController();
  final TextEditingController _shippingTEController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final CreateProfileController _createProfileController =
  Get.find<CreateProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const SizedBox(height: 32),
              const AuthHeader(
                title: "Complete Profile",
                subTitle: "Get started with us by providing your information.",
              ),
              const SizedBox(height: 16),
              CompleteProfileForm(
                formKey: _formKey,
                firstNameTEController: _firstNameTEController,
                lastNameTEController: _lastNameTEController,
                mobileTEController: _mobileTEController,
                cityTEController: _cityTEController,
                shippingTEController: _shippingTEController,
              ),
              const SizedBox(height: 16),
              _buildCompleteButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCompleteButton() {
    return GetBuilder<CreateProfileController>(
        builder: (createProfileController) {
          return Visibility(
            visible: !createProfileController.inProgress,
            replacement: const CenteredCircularProgressIndicator(),
            child: ElevatedButton(
              onPressed: _onTapCompleteButton,
              child: const Text('Complete'),
            ),
          );
        });
  }

  Future<void> _onTapCompleteButton() async {
    bool isCreated = await _createProfileController.createProfile(
      firstName: _firstNameTEController.text.trim(),
      lastName: _lastNameTEController.text.trim(),
      mobile: _mobileTEController.text.trim(),
      city: _cityTEController.text.trim(),
      shippingAddress: _shippingTEController.text.trim(),
      token: Get.arguments['token'],
    );

    if (isCreated) {
      await Get.find<ReadProfileController>().getProfileDetails(Get.arguments['token']);
      Get.toNamed(RoutesName.productDetailsScreen);
      if (mounted) {
        NotificationUtils.flushBarNotification(
          context: context,
          title: "Congratulations",
          message: "Profile Successfully Completed",
        );
      }
      debugPrint("Profile successfully created.");
    } else {
      if (mounted) {
        NotificationUtils.flushBarNotification(
          context: context,
          title: "Warning!",
          message: "Profile create failed! Try again.",
          backgroundColor: AppColors.redColor,
        );
      }
      debugPrint("Profile create failed.");
    }

    debugPrint("Token ${Get.arguments['token']}");
  }

  @override
  void dispose() {
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _mobileTEController.dispose();
    _cityTEController.dispose();
    _shippingTEController.dispose();
    super.dispose();
  }
}
