import 'dart:convert';
import 'package:anime_app/models/class.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:anime_app/config/app_config.dart';

Future<List<Anime>> searchAnime({required String query}) async {
  final baseUrl = 'https://api.myanimelist.net/v2/anime?q=$query&limit=10';

  try {
    final response = await http.get(
      Uri.parse(baseUrl),
      headers: {
        'X-MAL-CLIENT-ID': clientId,
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body)['data'];
      return data.map((anime) => Anime.fromJson(anime)).toList();
    } else {
      debugPrint('Code: ${response.statusCode}');
      debugPrint('Error: ${response.body}');
      return []; // Boş liste döndür
    }
  } catch (e) {
    debugPrint('Exception: $e');
    return []; // Boş liste döndür
  }
}
