import 'dart:convert';
import 'dart:io';

import 'package:bluey_app/features/home/model/section_model.dart';
import 'package:http/http.dart' as http;

class FirebaseApiClient {
  final http.Client httpClient;

  FirebaseApiClient({required this.httpClient});

  Future<List<SectionModel>> fetchSections() async {
    final response = await httpClient.get(Uri.parse(
        "https://bluey-app-49f78-default-rtdb.firebaseio.com/sections.json"));

    if (response.statusCode == HttpStatus.ok) {
      return SectionModel.fromJsonArray(jsonDecode(response.body));
    } else {
      throw Exception();
    }
  }
}
