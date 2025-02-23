import 'dart:io';

import 'package:mime/mime.dart';

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

  // Validate image type (JPEG or PNG)
  static String? validateImageType(File file) {
    final allowedTypes = ['image/jpeg', 'image/png'];
    final mimeType = lookupMimeType(file.path);

    if (mimeType == null || !allowedTypes.contains(mimeType)) {
      return 'Only JPEG and PNG images are allowed';
    }
    return null;
  }

  // Validate image size (max 5MB)
  static String? validateImageSize(File file) {
    const maxSizeInBytes = 5 * 1024 * 1024; // 5MB
    if (file.lengthSync() > maxSizeInBytes) {
      return 'Image size must be less than 5MB';
    }
    return null;
  }

  // Combined validation for image type and size
  static String? validateImage(File file) {
    final typeError = validateImageType(file);
    if (typeError != null) return typeError;

    final sizeError = validateImageSize(file);
    if (sizeError != null) return sizeError;

    return null; // No error
  }
}
