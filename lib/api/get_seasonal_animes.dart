import 'dart:convert';
import 'package:anime_app/config/app_config.dart';
import 'package:anime_app/models/class.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<Anime>> getseasonalAnimeDetails({
  required int limit,
  required int year,
  required String season,
}) async {
  final baseUrl =
      'https://api.myanimelist.net/v2/anime/season/$year/$season?limit=$limit';

  final response = await http.get(
    Uri.parse(baseUrl),
    headers: {
      'X-MAL-CLIENT-ID': clientId,
    },
  );

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = jsonDecode(response.body);
    final AnimeInfo seasonalanimeInfo = AnimeInfo.fromJson(data);
    return seasonalanimeInfo.animes.toList();
  } else {
    debugPrint("Error 2 : ${response.statusCode}");
    debugPrint("Body: ${response.body}");
    throw Exception("Failed to get data !");
  }
}
