import 'dart:io';

import 'package:flutter/material.dart';

class VehicleViewModel with ChangeNotifier {
  File? _vehicleBookPhoto;
  File? _incomeCertificatePhoto;
  File? _insuranceDocument;
  File? _vehicleFrontPhoto;
  File? _vehicleBackPhoto;

  File? get vehicleBookPhoto => _vehicleBookPhoto;

  File? get incomeCertificatePhoto => _incomeCertificatePhoto;

  File? get insuranceDocument => _insuranceDocument;

  File? get vehicleFrontPhoto => _vehicleFrontPhoto;

  File? get vehicleBackPhoto => _vehicleBackPhoto;

  void setVehicleBookPhoto(File file) {
    _vehicleBookPhoto = file;
    notifyListeners();
  }

  void setIncomeCertificatePhoto(File file) {
    _incomeCertificatePhoto = file;
    notifyListeners();
  }

  void setInsuranceDocument(File file) {
    _insuranceDocument = file;
    notifyListeners();
  }

  void setVehicleFrontPhoto(File file) {
    _vehicleFrontPhoto = file;
    notifyListeners();
  }

  void setVehicleBackPhoto(File file) {
    _vehicleBackPhoto = file;
    notifyListeners();
  }

  bool validate() {
    return _vehicleBookPhoto != null &&
        _incomeCertificatePhoto != null &&
        _insuranceDocument != null &&
        _vehicleFrontPhoto != null &&
        _vehicleBackPhoto != null;
  }
}
