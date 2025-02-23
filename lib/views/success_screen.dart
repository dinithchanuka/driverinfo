import 'package:driverinfo/viewmodels/bank_viewmodel.dart';
import 'package:driverinfo/viewmodels/driver_viewmodel.dart';
import 'package:driverinfo/viewmodels/license_viewmodel.dart';
import 'package:driverinfo/viewmodels/vehicle_viewmodel.dart';
import 'package:driverinfo/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final driverViewModel = Provider.of<DriverViewModel>(context);
    final licenseViewModel = Provider.of<LicenseViewModel>(context);
    final vehicleViewModel = Provider.of<VehicleViewModel>(context);
    final bankViewModel = Provider.of<BankViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Registration Successful')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Driver Details:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Text('Name: ${driverViewModel.driver.name}'),
            Text('Mobile: ${driverViewModel.driver.mobile}'),
            Text('Email: ${driverViewModel.driver.email}'),
            Text('NIC: ${driverViewModel.driver.nic}'),
            const SizedBox(height: 20),
            const Text('License Details:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            if (licenseViewModel.licenseFront != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Driving License Front:'),
                  const SizedBox(height: 8),
                  Image.file(licenseViewModel.licenseFront!, height: 150),
                  const SizedBox(height: 16),
                ],
              ),
            if (licenseViewModel.licenseBack != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Driving License Back:'),
                  const SizedBox(height: 8),
                  Image.file(licenseViewModel.licenseBack!, height: 150),
                  const SizedBox(height: 16),
                ],
              ),
            if (licenseViewModel.driverImage != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Driver Image:'),
                  const SizedBox(height: 8),
                  Image.file(licenseViewModel.driverImage!, height: 150),
                  const SizedBox(height: 16),
                ],
              ),
            const SizedBox(height: 20),
            const Text('Vehicle Details:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            if (vehicleViewModel.vehicleBookPhoto != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Vehicle Book Photo:'),
                  const SizedBox(height: 8),
                  Image.file(vehicleViewModel.vehicleBookPhoto!, height: 150),
                  const SizedBox(height: 16),
                ],
              ),
            if (vehicleViewModel.incomeCertificatePhoto != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Income Certificate Photo:'),
                  const SizedBox(height: 8),
                  Image.file(vehicleViewModel.incomeCertificatePhoto!,
                      height: 150),
                  const SizedBox(height: 16),
                ],
              ),
            if (vehicleViewModel.insuranceDocument != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Insurance Document:'),
                  const SizedBox(height: 8),
                  Image.file(vehicleViewModel.insuranceDocument!, height: 150),
                  const SizedBox(height: 16),
                ],
              ),
            if (vehicleViewModel.vehicleFrontPhoto != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Vehicle Front Photo:'),
                  const SizedBox(height: 8),
                  Image.file(vehicleViewModel.vehicleFrontPhoto!, height: 150),
                  const SizedBox(height: 16),
                ],
              ),
            if (vehicleViewModel.vehicleBackPhoto != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Vehicle Back Photo:'),
                  const SizedBox(height: 8),
                  Image.file(vehicleViewModel.vehicleBackPhoto!, height: 150),
                  const SizedBox(height: 16),
                ],
              ),
            const SizedBox(height: 20),
            const Text('Bank Details:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Text('Bank Name: ${bankViewModel.bank.bankName}'),
            Text('Account Number: ${bankViewModel.bank.accountNumber}'),
            Text('Branch: ${bankViewModel.bank.branch}'),
            Text(
                'Account Holder Name: ${bankViewModel.bank.accountHolderName}'),
            const SizedBox(height: 20),
            Center(
              child: CustomButton(
                text: 'Back to Home',
                onPressed: () =>
                    context.go('/'), // Navigate back to the home screen
              ),
            ),
          ],
        ),
      ),
    );
  }
}
