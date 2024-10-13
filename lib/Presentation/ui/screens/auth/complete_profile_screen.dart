import 'package:crafty_bay/Presentation/state_holders/auth/create_profile_controller.dart';
import 'package:crafty_bay/Presentation/ui/widgets/auth_header.dart';
import 'package:crafty_bay/Presentation/ui/widgets/complete_profile/complete_profile_form.dart';
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

  final CreateProfileController _createProfileController = Get.find<CreateProfileController>();

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
    return ElevatedButton(
      onPressed: _onTapCompleteButton,
      child: const Text('Complete'),
    );
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

   if(isCreated){
     debugPrint("Profile successfully created.");
   } else{
     debugPrint("Profile created failed.");
   }



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
