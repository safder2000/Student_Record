import 'dart:developer';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as Img;
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

ImagePicker? _imagePicker;
final ImagePicker _picker = ImagePicker();
Future<File?> _loadImage(ImageSource imageSource) async {
  PickedFile? file = (await _imagePicker!.getImage(source: imageSource));
  File? mFile;
  if (null != file) {
    // Directory directory = await getTemporaryDirectory();
    // mFile = await _saveImageToDisk(file.path, directory);
    // Map map = Map();
    // map['path'] = file.path;
    // map['directory'] = directory;
    // mFile = await compute(_saveImageToDisk, map);
  }
  return mFile;
}

Future<String?> _saveImageToDisk(Map map) async {
  try {
    String path = map['path'];
    Directory directory = map['directory'];
    File tempFile = File(path);
    Img.Image? image = Img.decodeImage(tempFile.readAsBytesSync());
    Img.Image mImage = Img.copyResize(image!, width: 512);
    String imgType = path.split('.').last;
    String mPath =
        // 'data/user/0/image_${DateTime.now()}.$imgType';
        '${directory.path.toString()}/image_${DateTime.now()}.$imgType';
    File dFile = File(mPath);
    if (imgType == 'jpg' || imgType == 'jpeg') {
      dFile.writeAsBytesSync(Img.encodeJpg(mImage));
    } else {
      dFile.writeAsBytesSync(Img.encodePng(mImage));
    }
    return mPath;
  } catch (e) {
    return null;
  }
}

Future<String?> imagePath() async {
  final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
  String ff = image!.path;

  Map map = Map();
  if (null != image) {
    Directory directory = await getTemporaryDirectory();
    //mFile = await _saveImageToDisk(file.path, directory);
    Map map = Map();
    map['path'] = image.path;
    map['directory'] = directory;
    String? imagePath = await compute(_saveImageToDisk, map);
    log("$imagePath >>>>>> new");
    return imagePath!;
  }
}
