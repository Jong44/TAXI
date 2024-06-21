import 'dart:io';

import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taxi_app/config/ColorConfig.dart';

class setMediaProfile {
  Future<File> getImageCamera() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      return File(pickedFile.path);
    } else {
      return File("");
    }
  }

  Future<File> getImageGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      return File(pickedFile.path);
    } else {
      return File("");
    }
  }

  Widget build(BuildContext context, File image, Function(File) setImage) {
    return AlertDialog(
      title: Text("Pilih Media"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: Iconify(Mdi.image),
            title: Text("Galeri"),
            onTap: () async {
              File image = await getImageGallery();
              setImage(image);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Iconify(Mdi.image),
            title: Text("Kamera"),
            onTap: () async {
              File image = await getImageCamera();
              setImage(image);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
