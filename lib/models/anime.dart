import 'package:anime_app/models/class.dart';

class AnimeDetails {
  final int id;
  final String title;
  final String startDate;
  final String status;
  final double mean;
  final int num_scoring_users;
  final int ep;
  final String description;

  final MainPicture? mainPicture;
  final AlternativeTitles? alternativeTitles;
  final List<Genre>? genres;
  final StartSeason? startSeason;
  final Broadcast? broadcast;
  final List<Picture>? pictures;
  final List<RelatedAnime>? relatedAnime;
  final List<RelatedManga>? relatedManga;
  final List<Recommendation>? recommendations;
  final List<Studio>? studios;
  final Statistics? statistics;

  AnimeDetails({
    required this.id,
    required this.title,
    required this.startDate,
    required this.status,
    required this.mean,
    required this.num_scoring_users,
    required this.ep,
    required this.description,
    this.mainPicture,
    this.alternativeTitles,
    this.genres,
    this.startSeason,
    this.broadcast,
    this.pictures,
    this.relatedAnime,
    this.relatedManga,
    this.recommendations,
    this.studios,
    this.statistics,
  });

  factory AnimeDetails.fromJson(Map<String, dynamic> json) {
    return AnimeDetails(
      id: json['id'] as int,
      title: json['title'] as String,
      startDate: json['start_date'] != null ? json['start_date'] as String : '',
      status: json['status'] as String,
      mean: (json['mean'] as num).toDouble(),
      num_scoring_users: json['num_scoring_users'] as int,
      ep: json['num_episodes'] as int,
      description: json['synopsis'] as String,
      mainPicture: json['main_picture'] != null
          ? MainPicture.fromJson(json['main_picture'])
          : null,
      alternativeTitles: json['alternative_titles'] != null
          ? AlternativeTitles.fromJson(json['alternative_titles'])
          : null,
      genres: json['genres'] != null
          ? (json['genres'] as List)
              .map((genreJson) => Genre.fromJson(genreJson))
              .toList()
          : [],
      startSeason: json['start_season'] != null
          ? StartSeason.fromJson(json['start_season'])
          : null,
      broadcast: json['broadcast'] != null
          ? Broadcast.fromJson(json['broadcast'])
          : null,
      pictures: json['pictures'] != null
          ? (json['pictures'] as List)
              .map((pictureJson) => Picture.fromJson(pictureJson))
              .toList()
          : [],
      relatedAnime: json['related_anime'] != null
          ? (json['related_anime'] as List)
              .map(
                  (relatedAnimeJson) => RelatedAnime.fromJson(relatedAnimeJson))
              .toList()
          : [],
      relatedManga: json['related_manga'] != null
          ? (json['related_manga'] as List)
              .map(
                  (relatedMangaJson) => RelatedManga.fromJson(relatedMangaJson))
              .toList()
          : [],
      recommendations: json['recommendations'] != null
          ? (json['recommendations'] as List)
              .map((recommendationJson) =>
                  Recommendation.fromJson(recommendationJson))
              .toList()
          : [],
      studios: json['studios'] != null
          ? (json['studios'] as List)
              .map((studioJson) => Studio.fromJson(studioJson))
              .toList()
          : [],
      statistics: json['statistics'] != null
          ? Statistics.fromJson(json['statistics'])
          : null,
    );
  }
}
