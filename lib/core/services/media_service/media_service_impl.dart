import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'media_services.dart';

class MediaServiceImpl implements MediaService {
  @override
  Future<File?> uploadImage(BuildContext context, AppImageSource appImageSource) async {
    try {
      File? processedPickedImageFile;
      ImageSource? imageSource = ImageSource.values.byName(appImageSource.name);
      final imagePicker = ImagePicker();
      final rawPickedImageFile = await imagePicker.pickImage(source: imageSource, imageQuality: 50);
      if (rawPickedImageFile != null) {
        processedPickedImageFile = File(rawPickedImageFile.path);
        processedPickedImageFile = await compressFile(processedPickedImageFile);
        return processedPickedImageFile;
      }
      return null;
    } catch (_) {
      return null;
    }
  }

  @override
  Future<List<File?>?> uploadMultiImage(BuildContext context) async {
    try {
      List<File?> pickedImageFiles = [];
      final imagePicker = ImagePicker();
      final rawPickedImageFiles = await imagePicker.pickMultiImage(imageQuality: 50);
      if (rawPickedImageFiles.isNotEmpty) {
        pickedImageFiles.clear();
        for (var file in rawPickedImageFiles) {
          final processedPickedImageFile = await compressFile(File(file.path));
          pickedImageFiles.add(processedPickedImageFile);
        }
        return pickedImageFiles;
      }
      return null;
    } catch (_) {
      return null;
    }
  }


  @override
  Future<File?> compressFile(File file, {int quality = 30}) async {
    final dir = await path_provider.getTemporaryDirectory();
    String targetPath = '${dir.absolute.path}/${Random().nextInt(1000)}-temp.jpg';

    // Compress the image with the given quality
    // XFile? compressedXFile = await FlutterImageCompress.compressAndGetFile(
    //   file.absolute.path, targetPath, quality: quality,
    // );
    //
    // // Create a file object to check its size
    // File? compressedFile = compressedXFile != null ? File(compressedXFile.path) : null;
    //
    // // Check if the file size is already <= 1MB
    // if (compressedFile != null && await compressedFile.length() <= 1000000) {
    //   // If the file size is <= 1MB, return the compressed file without doing anything
    //   return compressedFile;
    // }

    // // If the file is larger than 1MB, reduce quality and compress again
    // while (compressedFile != null && await compressedFile.length() > 1000000) {
    //   // Reduce quality by 5% and compress again
    //   quality = (quality > 5) ? quality - 5 : 5;
    //   // compressedXFile = await FlutterImageCompress.compressAndGetFile(
    //   //   file.absolute.path, targetPath, quality: quality,
    //   // );
    //   compressedFile = compressedXFile != null ? File(compressedXFile.path) : null;
    // }

    // return compressedFile;
    return file ;
  }

}