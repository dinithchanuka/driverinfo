import 'dart:io';

import 'package:flutter/material.dart';

class LicenseViewModel with ChangeNotifier {
  File? _licenseFront;
  File? _licenseBack;
  File? _driverImage;
  File? _additionalDocuments;

  File? get licenseFront => _licenseFront;
  File? get licenseBack => _licenseBack;
  File? get driverImage => _driverImage;
  File? get additionalDocuments => _additionalDocuments;

  void setLicenseFront(File file) {
    _licenseFront = file;
    notifyListeners();
  }

  void setLicenseBack(File file) {
    _licenseBack = file;
    notifyListeners();
  }

  void setDriverImage(File file) {
    _driverImage = file;
    notifyListeners();
  }

  void setAdditionalDocuments(File file) {
    _additionalDocuments = file;
    notifyListeners();
  }

  // Validate that all required images are uploaded
  bool validate() {
    return _licenseFront != null && _licenseBack != null && _driverImage != null;
  }
}