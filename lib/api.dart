import 'dart:async';
import 'package:http/http.dart' as http;

class CharacterApi {
  static Future getCharacter() {
    return http.get(Uri.parse("https://coderbyte.com/api/challenges/json/json-cleaning"));
  }
}