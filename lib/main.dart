import 'package:driverinfo/routes/app_routes.dart';
import 'package:driverinfo/viewmodels/driver_viewmodel.dart';
import 'package:driverinfo/viewmodels/license_viewmodel.dart';
import 'package:driverinfo/viewmodels/vehicle_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => DriverViewModel()),
      ChangeNotifierProvider(create: (_) => LicenseViewModel()),
      ChangeNotifierProvider(create: (_) => VehicleViewModel()),
    ],
    child: MyApp(),
  ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Driver Info',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}