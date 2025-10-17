import 'dart:convert';
import 'package:flutter_app/data/models/protone-builds.models.dart';
import 'package:http/http.dart' as http;

class ProtoneBuildsService {
  static Future<List<BuildInfo>?> getProtoneBuilds(String type) async {
    final url = Uri.https('ocpa.ro', '/api/protone', {'release': type});
    final response = await http.get(url, headers: { 'Accept': 'application/json' });
    if (response.statusCode != 200) {
      print('Failed to retrieve the http package!');
      return null;
    }

    final List<dynamic> builds = jsonDecode(response.body);
    return builds.map((entry) => BuildInfo.fromJson(entry)).toList();
  }
}
