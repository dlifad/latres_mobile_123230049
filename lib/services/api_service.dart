import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {

  static Future<List<dynamic>> getShows() async {

    final response = await http.get(
      Uri.parse('https://api.tvmaze.com/shows'),
    );

    return jsonDecode(response.body);
  }

  static Future<dynamic> getDetail(int id) async {

    final response = await http.get(
      Uri.parse('https://api.tvmaze.com/shows/$id'),
    );

    return jsonDecode(response.body);
  }
}