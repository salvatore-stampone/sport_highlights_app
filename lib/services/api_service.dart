import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/match.dart';
import '../models/highlight.dart';

class ApiService {
  final String baseUrl =
      'http://<tuo-backend-url>'; // TODO: Replace with your backend URL

  Future<List<Match>> fetchMatches() async {
    final response = await http.get(Uri.parse('$baseUrl/matches'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Match.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load matches');
    }
  }

  Future<List<Highlight>> fetchHighlightsByMatch(int matchId) async {
    final response =
        await http.get(Uri.parse('$baseUrl/highlights/match/$matchId'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Highlight.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load highlights');
    }
  }
}
