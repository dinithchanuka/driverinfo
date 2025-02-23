import 'package:driverinfo/models/bank.dart';
import 'package:flutter/material.dart';

class BankViewModel with ChangeNotifier {
  Bank _bank = Bank(bankName: '', accountNumber: '', branch: '', accountHolderName: '');

  Bank get bank => _bank;

  void updateBankDetails(String bankName, String accountNumber, String branch, String accountHolderName) {
    _bank = Bank(
      bankName: bankName,
      accountNumber: accountNumber,
      branch: branch,
      accountHolderName: accountHolderName,
    );
    notifyListeners();
  }
}