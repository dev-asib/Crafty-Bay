import 'package:crafty_bay/Presentation/ui/widgets/auth_header.dart';
import 'package:crafty_bay/Presentation/ui/widgets/complete_profile/complete_profile_form.dart';
import 'package:flutter/material.dart';

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

  void _onTapCompleteButton() {}

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
