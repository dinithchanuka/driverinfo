import 'package:driverinfo/views/driver_details_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => DriverDetailsScreen(),
    ),
  ],
);
