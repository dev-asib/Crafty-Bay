import 'package:crafty_bay/Presentation/ui/widgets/user_profile/edit_profile_form.dart';
import 'package:flutter/material.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  final TextEditingController _customerNameTEController =
      TextEditingController();
  final TextEditingController _customerAddressTEController =
      TextEditingController();
  final TextEditingController _customerCityTEController =
      TextEditingController();
  final TextEditingController _customerStateTEController =
      TextEditingController();
  final TextEditingController _customerPostCodeTEController =
      TextEditingController();
  final TextEditingController _customerCountryTEController =
      TextEditingController();
  final TextEditingController _customerPhoneTEController =
      TextEditingController();
  final TextEditingController _customerFaxTEController =
      TextEditingController();
  final TextEditingController _shippingNameTEController =
      TextEditingController();
  final TextEditingController _shippingAddressTEController =
      TextEditingController();
  final TextEditingController _shippingCityTEController =
      TextEditingController();
  final TextEditingController _shippingStateTEController =
      TextEditingController();
  final TextEditingController _shippingPostCodeTEController =
      TextEditingController();
  final TextEditingController _shippingCountryTEController =
      TextEditingController();
  final TextEditingController _shippingPhoneTEController =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          EditProfileForm(
            formKey: _formKey,
            customerNameTEController: _customerNameTEController,
            customerAddressTEController: _customerAddressTEController,
            customerCityTEController: _customerCityTEController,
            customerStateTEController: _customerStateTEController,
            customerPostCodeTEController: _customerPostCodeTEController,
            customerCountryTEController: _customerCountryTEController,
            customerPhoneTEController: _customerPhoneTEController,
            customerFaxTEController: _customerFaxTEController,
            shippingNameTEController: _shippingNameTEController,
            shippingAddressTEController: _shippingAddressTEController,
            shippingCityTEController: _shippingCityTEController,
            shippingStateTEController: _shippingStateTEController,
            shippingPostCodeTEController: _shippingPostCodeTEController,
            shippingCountryTEController: _shippingCountryTEController,
            shippingPhoneTEController: _shippingPhoneTEController,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {},
            child: const Text("Save"),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _customerNameTEController.dispose();
    _customerAddressTEController.dispose();
    _customerCityTEController.dispose();
    _customerStateTEController.dispose();
    _customerPostCodeTEController.dispose();
    _customerCountryTEController.dispose();
    _customerPhoneTEController.dispose();
    _customerFaxTEController.dispose();
    _shippingNameTEController.dispose();
    _shippingAddressTEController.dispose();
    _shippingCityTEController.dispose();
    _shippingStateTEController.dispose();
    _shippingPostCodeTEController.dispose();
    _shippingCountryTEController.dispose();
    _shippingPhoneTEController.dispose();
    super.dispose();
  }
}
