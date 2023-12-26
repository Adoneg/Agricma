import 'dart:io';
import 'package:http/http.dart' as http;

void main() async { 
  var url = Uri.parse('http://127.0.0.1:8000/api/imgdata/1');
  var headers = {
    'Authorization': 'YAAI5Vim.CDcomUFQOpsu7ZNoglbpi66pqUgEdaP7'
  };

  var response = await http.get(url, headers: headers);

  if (response.statusCode == 200) {
    var directoryPath = 'media/images/api_img/';
    await Directory(directoryPath).create(recursive: true);
    var filePath = '$directoryPath/example.jpg';
    await File(filePath).writeAsBytes(response.bodyBytes);
    print('Image saved to: $filePath');
  } else {
    print('Failed to retrieve the image. Status code: ${response.statusCode}');
  }
}
