import 'dart:io';

class ImageUtils {
  // Check if the file is larger than 1MB
  static Future<bool> isImageLargerThan1MB(File file) async {
    final fileSizeInBytes = await file.length();
    return fileSizeInBytes > 1 * 1024 * 1024; // 1MB in bytes
  }

  // Compress the image to ensure it is under 1MB
  static Future<File?> compressImageToFitSize(File file) async {
    const maxSizeInBytes = 1 * 1024 * 1024; // 1MB in bytes

    // Initial compression attempt
    File? compressedFile = await _compress(file);

    // If the compressed file is still larger than 1MB, keep compressing
    while (compressedFile != null && await compressedFile.length() > maxSizeInBytes) {
      compressedFile = await _compress(compressedFile);
    }

    return compressedFile;
  }

  // Helper method for compressing the file
  static Future<File?> _compress(File file) async {
    // final result = await FlutterImageCompress.compressWithFile(
    //   file.absolute.path,
    //   minWidth: 800,  // Resize to 800px width
    //   minHeight: 800,  // Resize to 800px height
    //   quality: 80,  // 80% quality
    //   rotate: 0,  // No rotation
    // );

    // if (result != null) {
    //   final compressedFile = File(file.absolute.path)..writeAsBytesSync(result);
    //   return compressedFile;
    // }
    // return null;
    return file;
  }
}
