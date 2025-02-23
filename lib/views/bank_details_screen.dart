import 'package:driverinfo/core/validation_utils.dart';
import 'package:driverinfo/viewmodels/bank_viewmodel.dart';
import 'package:driverinfo/widgets/custom_button.dart';
import 'package:driverinfo/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class BankDetailsScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _bankNameController = TextEditingController();
  final _accountNumberController = TextEditingController();
  final _branchController = TextEditingController();
  final _accountHolderNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final bankViewModel = Provider.of<BankViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Bank Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: 'Bank Name'),
                items: <String>['Bank A', 'Bank B', 'Bank C', 'Bank D']
                    .map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  _bankNameController.text = value!;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a bank';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              CustomTextField(
                labelText: 'Account Number',
                controller: _accountNumberController,
                validator: (value) {
                  final requiredError =
                  ValidationUtils.validateRequired(value, 'Account Number');
                  if (requiredError != null) {
                    return requiredError;
                  }
                  return ValidationUtils.validateAccountNumber(value);
                },
              ),
              SizedBox(height: 16),
              CustomTextField(
                labelText: 'Branch',
                controller: _branchController,
                validator: (value) =>
                    ValidationUtils.validateRequired(value, 'Branch'),
              ),
              SizedBox(height: 16),
              CustomTextField(
                labelText: 'Account Holder Name',
                controller: _accountHolderNameController,
                validator: (value) =>
                    ValidationUtils.validateRequired(value, 'Account Holder Name'),
              ),
              SizedBox(height: 20),
              CustomButton(
                text: 'Submit',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    bankViewModel.updateBankDetails(
                      _bankNameController.text,
                      _accountNumberController.text,
                      _branchController.text,
                      _accountHolderNameController.text,
                    );
                    context.go('/success');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}