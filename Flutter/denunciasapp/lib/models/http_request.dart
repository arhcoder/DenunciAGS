import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

Future<void> sendFormData(String name, String phone, File imageFile) async {
  var url = Uri.parse('http://example.com/api/form-data');
  var request = http.MultipartRequest('POST', url);
  request.fields['name'] = name;
  request.fields['phone'] = phone;
  var imageBytes = await imageFile.readAsBytes();
  var image =
      http.MultipartFile.fromBytes('image', imageBytes, filename: 'image.jpg');
  request.files.add(image);
  var response = await request.send();
  if (response.statusCode == 200) {
    print('Form data sent successfully!');
  } else {
    print('Failed to send form data. Error code: ${response.statusCode}');
  }
}
