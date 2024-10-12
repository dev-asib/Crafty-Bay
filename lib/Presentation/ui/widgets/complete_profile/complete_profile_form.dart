import 'package:flutter/material.dart';

class CompleteProfileForm extends StatelessWidget {
  const CompleteProfileForm({
    super.key,
    required GlobalKey<FormState> formKey,
    required TextEditingController firstNameTEController,
    required TextEditingController lastNameTEController,
    required TextEditingController mobileTEController,
    required TextEditingController cityTEController,
    required TextEditingController shippingTEController,
  })  : _formKey = formKey,
        _firstNameTEController = firstNameTEController,
        _lastNameTEController = lastNameTEController,
        _mobileTEController = mobileTEController,
        _cityTEController = cityTEController,
        _shippingTEController = shippingTEController;

  final GlobalKey<FormState> _formKey;
  final TextEditingController _firstNameTEController;
  final TextEditingController _lastNameTEController;
  final TextEditingController _mobileTEController;
  final TextEditingController _cityTEController;
  final TextEditingController _shippingTEController;

  @override
  Widget build(BuildContext context) {
    return Form(
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
            decoration: const InputDecoration(hintText: "Shipping Address"),
          ),
        ],
      ),
    );
  }
}
