import 'package:driverinfo/models/driver.dart';
import 'package:flutter/material.dart';

class DriverViewModel with ChangeNotifier {
  Driver _driver = Driver(name: '', mobile: '', email: '', nic: '');

  Driver get driver => _driver;

  void updateDriverDetails(
      String name, String mobile, String email, String nic) {
    _driver = Driver(name: name, mobile: mobile, email: email, nic: nic);
    notifyListeners();
  }
}
