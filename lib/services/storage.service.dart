import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

import '../helpers/util.helper.dart';
import 'api.dart';

class StorageApi {
  final apiUrl = 'storage';

  Future<List<String>?> uploadImages(
      {required List<XFile> images,
      String? pathType,
      List<String> filesToDelete = const []}) async {
    var formData = FormData.fromMap({
      'files': images
          .map((image) =>
              MultipartFile.fromFileSync(image.path, filename: image.name))
          .toList(),
      'pathType': pathType,
      'filesToDelete[]':
          filesToDelete.map((item) => getOriginalImageUrl(item)).toList()
    });

    Response<List<dynamic>> response =
        await Api(isMultipartData: true).dio.post(apiUrl, data: formData);

    if (response.statusCode != 201) {
      return null;
    }
    return response.data!.map((item) => item.toString()).toList();
  }

  Future delete({required List<String> filesToDelete}) async {
    var objData = {
      'filesToDelete': filesToDelete.map((item) => getOriginalImageUrl(item)).toList()
    };

    await Api().dio.delete(apiUrl, data: objData);
  }
}
