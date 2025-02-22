import 'package:driverinfo/core/validation_utils.dart';
import 'package:driverinfo/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class DriverDetailsScreen extends StatelessWidget {
  DriverDetailsScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _mobileController = TextEditingController();
  final _emailController = TextEditingController();
  final _nicController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Driver Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextField(
                labelText: 'Name',
                hintText: 'Enter your name',
                controller: _nameController,
                validator: (value) =>
                    ValidationUtils.validateRequired(value, 'Name'),
              ),
              const SizedBox(height: 16),
              CustomTextField(
                labelText: 'Mobile',
                hintText: 'Enter your mobile number',
                controller: _mobileController,
                keyboardType: TextInputType.phone,
                validator: (value) {
                  final requiredError =
                      ValidationUtils.validateRequired(value, 'Mobile');
                  if (requiredError != null) {
                    return requiredError;
                  }
                  return ValidationUtils.validateMobile(value);
                },
              ),
              const SizedBox(height: 16),
              CustomTextField(
                labelText: 'Email',
                hintText: 'Enter your email address',
                controller: _emailController,
                keyboardType: TextInputType.phone,
                validator: (value) {
                  final requiredError =
                      ValidationUtils.validateRequired(value, 'Email');
                  if (requiredError != null) {
                    return requiredError;
                  }
                  return ValidationUtils.validateEmail(value);
                },
              ),
              const SizedBox(height: 16),
              CustomTextField(
                labelText: 'NIC',
                hintText: 'Enter your NIC number',
                controller: _nicController,
                keyboardType: TextInputType.phone,
                validator: (value) {
                  final requiredError =
                      ValidationUtils.validateRequired(value, 'NIC');
                  if (requiredError != null) {
                    return requiredError;
                  }
                  return ValidationUtils.validateNIC(value);
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                  }
                },
                child: const Text('Next'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
