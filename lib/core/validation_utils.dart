class ValidationUtils {
  // Validate if a field is empty
  static String? validateRequired(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  // Validate mobile format (10 digits)
  static String? validateMobile(String? value) {
    if (value == null || value.isEmpty) {
      return 'Mobile is required';
    }
    if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
      return 'Mobile must be 10 digits';
    }
    return null;
  }

  // Validate email format
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Invalid email format';
    }
    return null;
  }

  // Validate NIC format (Sri Lankan NIC)
  static String? validateNIC(String? value) {
    if (value == null || value.isEmpty) {
      return 'NIC is required';
    }
    if (!RegExp(r'^[0-9]{9}[vVxX]?$').hasMatch(value)) {
      return 'Invalid NIC format';
    }
    return null;
  }
}
