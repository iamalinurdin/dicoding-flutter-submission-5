import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class FileProvider with ChangeNotifier {
  String? imagePath;
  XFile? imageFile;

  void setImagePath(String? value) {
    imagePath = value;
    notifyListeners();
  }

  void setImageFile(XFile? value) {
    imageFile = value;
    notifyListeners();
  }
}