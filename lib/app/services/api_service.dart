import 'package:dio/dio.dart';
import '../constants.dart';
import '../models/character_model.dart';

class RemoteServices {
  static var dio = Dio();

  static Future<List<Character>> fetchCharacters() async {
    var response = await dio.get(baseUrl);
    if (response.statusCode == 200) {
      var characters = response.data as List;
      return characters
          .map((character) => Character.fromJson(character))
          .toList();
    } else {
      throw Exception('Failed to load characters');
    }
  }
}
