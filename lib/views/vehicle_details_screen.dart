import 'package:driverinfo/viewmodels/vehicle_viewmodel.dart';
import 'package:driverinfo/widgets/custom_button.dart';
import 'package:driverinfo/widgets/image_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VehicleDetailsScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final vehicleViewModel = Provider.of<VehicleViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Vehicle Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImagePickerWidget(
                label: 'Vehicle Book Photo',
                onImagePicked: (file) => vehicleViewModel.setVehicleBookPhoto(file),
                selectedFile: vehicleViewModel.vehicleBookPhoto,
              ),
              const SizedBox(height: 16),
              ImagePickerWidget(
                label: 'Income Certificate Photo',
                onImagePicked: (file) => vehicleViewModel.setIncomeCertificatePhoto(file),
                selectedFile: vehicleViewModel.incomeCertificatePhoto,
              ),
              const SizedBox(height: 16),
              ImagePickerWidget(
                label: 'Insurance Document',
                onImagePicked: (file) => vehicleViewModel.setInsuranceDocument(file),
                selectedFile: vehicleViewModel.insuranceDocument,
              ),
              const SizedBox(height: 16),
              ImagePickerWidget(
                label: 'Vehicle Front Photo',
                onImagePicked: (file) => vehicleViewModel.setVehicleFrontPhoto(file),
                selectedFile: vehicleViewModel.vehicleFrontPhoto,
              ),
              const SizedBox(height: 16),
              ImagePickerWidget(
                label: 'Vehicle Back Photo',
                onImagePicked: (file) => vehicleViewModel.setVehicleBackPhoto(file),
                selectedFile: vehicleViewModel.vehicleBackPhoto,
              ),
              SizedBox(height: 20),
              CustomButton(
                text: 'Next',
                onPressed: () {
                  if (vehicleViewModel.validate()) {

                  } else {
                    // Show error message if validation fails
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