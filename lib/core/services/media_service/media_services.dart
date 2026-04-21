import 'dart:io';
import 'package:flutter/cupertino.dart';

enum AppImageSource {
  camera,
  gallery,
}

abstract class MediaService {
  Future<File?> uploadImage(BuildContext context,AppImageSource appImageSource);
  Future<List<File?>?> uploadMultiImage(BuildContext context);
  Future<File?> compressFile(File file, {int quality = 30});
}