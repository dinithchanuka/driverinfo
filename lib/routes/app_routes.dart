import 'package:driverinfo/views/driver_details_screen.dart';
import 'package:driverinfo/views/license_verification_screen.dart';
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
  ],
);
