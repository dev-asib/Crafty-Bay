import 'package:crafty_bay/Presentation/ui/widgets/app_logo_widget.dart';
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
              const AppLogoWidget(),
              const SizedBox(height: 24),
              Text(
                "Complete Profile",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 8),
              Text(
                textAlign: TextAlign.center,
                "Get started with us by providing your information.",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.black45,
                    ),
              ),
              const SizedBox(height: 16),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _firstNameTEController,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(hintText: "FirstName"),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _lastNameTEController,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(hintText: "Last Name"),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _mobileTEController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(hintText: "Mobile"),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _cityTEController,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(hintText: "City"),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _shippingTEController,
                      textInputAction: TextInputAction.next,
                      maxLines: 4,
                      decoration:
                          const InputDecoration(hintText: "Shipping Address"),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _onTapCompleteButton,
                child: const Text('Complete'),
              ),
            ],
          ),
        ),
      ),
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
