import 'dart:io';

import 'package:driverinfo/core/validation_utils.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerWidget extends StatelessWidget {
  final String label;
  final Function(File) onImagePicked;
  final bool isRequired;

  ImagePickerWidget({
    required this.label,
    required this.onImagePicked,
    this.isRequired = true,
  });

  Future<void> _pickImage(BuildContext context) async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery, maxWidth: 800, maxHeight: 800);
    if (pickedFile != null) {
      final file = File(pickedFile.path);

      // Validate the image
      final validationError = ValidationUtils.validateImage(file);
      if (validationError != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(validationError)),
        );
      } else {
        onImagePicked(file);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$label ${isRequired ? '*' : ''}'),
        SizedBox(height: 8),
        ElevatedButton(
          onPressed: () => _pickImage(context),
          child: Text('Upload Image'),
        ),
      ],
    );
  }
}