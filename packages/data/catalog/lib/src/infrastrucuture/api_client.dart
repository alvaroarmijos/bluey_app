import 'dart:convert';
import 'dart:io';

import 'package:catalog/src/infrastrucuture/api_dtos.dart';
import 'package:http/http.dart' as http;

class FirebaseApiClient {
  final http.Client httpClient;

  FirebaseApiClient({required this.httpClient});

  Future<List<SectionDto>> fetchSections() async {
    final response = await httpClient.get(Uri.parse(
        "https://bluey-app-49f78-default-rtdb.firebaseio.com/sections.json"));

    if (response.statusCode == HttpStatus.ok) {
      return SectionDto.fromJsonArray(jsonDecode(response.body));
    } else {
      throw Exception();
    }
  }

  Future<CharacterDto> fetchCharacter(int id) async {
    final response = await httpClient.get(Uri.parse(
        "https://bluey-app-49f78-default-rtdb.firebaseio.com/characters/$id.json"));

    if (response.statusCode == HttpStatus.ok) {
      return CharacterDto.fromJson(jsonDecode(response.body));
    } else {
      throw Exception();
    }
  }
}
