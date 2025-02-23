import 'package:driverinfo/views/bank_details_screen.dart';
import 'package:driverinfo/views/driver_details_screen.dart';
import 'package:driverinfo/views/license_verification_screen.dart';
import 'package:driverinfo/views/success_screen.dart';
import 'package:driverinfo/views/vehicle_details_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => DriverDetailsScreen(),
    ),
    GoRoute(
      path: '/license',
      builder: (context, state) => LicenseVerificationScreen(),
    ),
    GoRoute(
      path: '/vehicle',
      builder: (context, state) => VehicleDetailsScreen(),
    ),
    GoRoute(
      path: '/bank',
      builder: (context, state) => BankDetailsScreen(),
    ),
    GoRoute(
      path: '/success',
      builder: (context, state) => SuccessScreen(),
    ),
  ],
);
