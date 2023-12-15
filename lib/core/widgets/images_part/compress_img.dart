// import 'dart:io';
// import 'dart:math';
// import 'package:flutter_image_compress/flutter_image_compress.dart';
// import 'package:path_provider/path_provider.dart';
//
// Future<File> CompressImage(File storedImage) async {
//
//   final bytes = (await storedImage.readAsBytes()).lengthInBytes;
//   print("before::$bytes::Bytes::");
//
//   if(bytes<100000)return storedImage;
//
//   File imageFile;
//   final dir = await getTemporaryDirectory();
//   Random random = new Random();
//   int randomNumber = random.nextInt(100);
//   String randomNumberString = randomNumber.toString();
//   String uploadedImageUrl = '';
//   imageFile = await FlutterImageCompress.compressAndGetFile(
//     storedImage.path,
//     '${dir.absolute.path}/test${randomNumberString}.jpg',
//     minWidth: 250,
//     minHeight: 150,
//     quality: 50,
//   );
//   print('000:: ${dir.absolute.path}/test${randomNumberString}.jpg');
//
//   final bytesz = (await imageFile.readAsBytes()).lengthInBytes;
//   print("after::$bytesz::Bytes::");
//   return imageFile;
// }