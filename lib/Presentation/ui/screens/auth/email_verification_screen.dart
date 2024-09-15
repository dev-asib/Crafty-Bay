import 'package:crafty_bay/Presentation/ui/widgets/app_logo_widget.dart';
import 'package:crafty_bay/app/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {

  final TextEditingController _emailTEController = TextEditingController();

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
                "Welcome Back",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 8),
              Text(
                "Please enter your email address.",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.black45,
                    ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _emailTEController,
                decoration: const InputDecoration(hintText: "Email"),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _onTapNextButton,
                child: const Text('Next'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onTapNextButton(){
    Get.toNamed(RoutesName.otpVerificationScreen);
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    super.dispose();
  }
}
