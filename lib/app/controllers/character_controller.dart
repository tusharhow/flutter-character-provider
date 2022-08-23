import 'package:flutter/cupertino.dart';
import 'package:flutter_character_app/app/models/character_model.dart';
import '../services/api_service.dart';

class CharacterController extends ChangeNotifier {
  bool isLoading = false;
  List<Character> characters = [];
  CharacterController() {
    fetchCharacters();
  }

  Future<void> fetchCharacters() async {
    isLoading = true;
    notifyListeners();
    characters = await RemoteServices.fetchCharacters();
    isLoading = false;
    notifyListeners();
  }
}
