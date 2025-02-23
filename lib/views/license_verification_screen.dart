import 'package:driverinfo/viewmodels/license_viewmodel.dart';
import 'package:driverinfo/widgets/custom_button.dart';
import 'package:driverinfo/widgets/image_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LicenseVerificationScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final licenseViewModel = Provider.of<LicenseViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text('License Verification')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImagePickerWidget(
                label: 'Driving License Front',
                onImagePicked: (file) => licenseViewModel.setLicenseFront(file),
                selectedFile: licenseViewModel.licenseFront,
              ),
              const SizedBox(height: 16),
              ImagePickerWidget(
                label: 'Driving License Back',
                onImagePicked: (file) => licenseViewModel.setLicenseBack(file),
                selectedFile: licenseViewModel.licenseBack,
              ),
              const SizedBox(height: 16),
              ImagePickerWidget(
                label: 'Driver Image',
                onImagePicked: (file) => licenseViewModel.setDriverImage(file),
                selectedFile: licenseViewModel.driverImage,
              ),
              const SizedBox(height: 16),
              ImagePickerWidget(
                label: 'Additional Documents (Optional)',
                onImagePicked: (file) => licenseViewModel.setAdditionalDocuments(file),
                isRequired: false,
                  selectedFile: licenseViewModel.additionalDocuments,
              ),
              const SizedBox(height: 16),
              CustomButton(
                text: 'Next',
                onPressed: () {
                  if (licenseViewModel.validate()) {

                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please upload all required images')),
                    );
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