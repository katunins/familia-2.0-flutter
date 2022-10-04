import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

import '../helpers/util.helper.dart';
import 'api.dart';

class StorageApi {
  final apiUrl = 'storage';

  Future<String?> uploadImage(
      {required XFile image, List<String> filesToDelete = const []}) async {
    var formData = FormData.fromMap({
      'files': [MultipartFile.fromFileSync(image.path, filename: image.name)],
      'filesToDelete[]': filesToDelete.map((item) => getOriginalImageUrl(item)).toList()
    });
    var response =
    await Api(isMultipartData: true).dio.post(apiUrl, data: formData);
    if (response.statusCode != 201) {
      return null;
    }
    List<dynamic> imageUrls = response.data ?? [];
    if (imageUrls.isEmpty) {
      return null;
    }
    return imageUrls[0];
  }
}
