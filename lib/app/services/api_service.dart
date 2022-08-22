import 'package:http/http.dart' as http;
import '../constants.dart';
import '../models/character_model.dart';

class RemoteServices {
  static var client = http.Client();

  static Future<List<Character>> fetchCharacters() async {
    var response = await client.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return characterFromJson(jsonString);
    } else {
      throw Exception('Failed to load characters');
    }
  }
}
