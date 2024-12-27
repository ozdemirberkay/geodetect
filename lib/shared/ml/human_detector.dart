import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class HumanDetector {
  static Future<int> detectHumanFromImage(XFile image) async {
    final File imageFile = File(image.path);
    int? count = await sendImageToServer(imageFile);

    return count ?? 0;
  }

  static final serverURL = "YOUR_SERVER_BASE_URL";

  static Future<int?> sendImageToServer(File imageFile) async {
    final url = Uri.parse("$serverURL/predict");
    final request = http.MultipartRequest("POST", url);

    request.files
        .add(await http.MultipartFile.fromPath('image', imageFile.path));

    try {
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        return jsonDecode(response.body)["count"];
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
