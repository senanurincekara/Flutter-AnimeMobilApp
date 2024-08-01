// Sub-models for various parts of the Anime class
class MainPicture {
  final String medium;
  final String large;

  MainPicture({required this.medium, required this.large});

  factory MainPicture.fromJson(Map<String, dynamic> json) {
    return MainPicture(
      medium: json['medium'],
      large: json['large'],
    );
  }
}

class AlternativeTitles {
  final List<String> synonyms;
  final String en;
  final String ja;

  AlternativeTitles(
      {required this.synonyms, required this.en, required this.ja});

  factory AlternativeTitles.fromJson(Map<String, dynamic> json) {
    return AlternativeTitles(
      synonyms: List<String>.from(json['synonyms']),
      en: json['en'],
      ja: json['ja'],
    );
  }
}

class Genre {
  final int id;
  final String name;

  Genre({required this.id, required this.name});

  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(
      id: json['id'],
      name: json['name'],
    );
  }
}

class StartSeason {
  final int year;
  final String season;

  StartSeason({required this.year, required this.season});

  factory StartSeason.fromJson(Map<String, dynamic> json) {
    return StartSeason(
      year: json['year'],
      season: json['season'],
    );
  }
}

class Broadcast {
  final String dayOfTheWeek;
  final String startTime;

  Broadcast({required this.dayOfTheWeek, required this.startTime});

  factory Broadcast.fromJson(Map<String, dynamic> json) {
    return Broadcast(
      dayOfTheWeek: json['day_of_the_week'],
      startTime: json['start_time'],
    );
  }
}

class Picture {
  final String medium;
  final String large;

  Picture({required this.medium, required this.large});

  factory Picture.fromJson(Map<String, dynamic> json) {
    return Picture(
      medium: json['medium'],
      large: json['large'],
    );
  }
}

class RelatedAnime {
  final RelatedNode node;
  final String relationType;

  RelatedAnime({required this.node, required this.relationType});

  factory RelatedAnime.fromJson(Map<String, dynamic> json) {
    return RelatedAnime(
      node: RelatedNode.fromJson(json['node']),
      relationType: json['relation_type'],
    );
  }
}

//animenode
class RelatedNode {
  final int id;
  final String title;
  final MainPicture mainPicture;

  RelatedNode(
      {required this.id, required this.title, required this.mainPicture});

  factory RelatedNode.fromJson(Map<String, dynamic> json) {
    return RelatedNode(
      id: json['id'],
      title: json['title'],
      mainPicture: MainPicture.fromJson(json['main_picture']),
    );
  }
}

//....

class AnimeInfo {
  final Iterable<Anime> animes;

  const AnimeInfo({
    required this.animes,
  });

  factory AnimeInfo.fromJson(Map<String, dynamic> json) {
    List<dynamic> animeRankingList = json['data'];
    List<Anime> animeRankingItems = animeRankingList
        .map(
          (item) => Anime.fromJson(item),
        )
        .toList();

    return AnimeInfo(
      animes: animeRankingItems,
    );
  }
}

class AnimeNode {
  final int id;
  final String title;
  final MainPicture mainPicture;

  AnimeNode({required this.id, required this.title, required this.mainPicture});

  factory AnimeNode.fromJson(Map<String, dynamic> json) {
    return AnimeNode(
      id: json['id'],
      title: json['title'],
      mainPicture: MainPicture.fromJson(json['main_picture']),
    );
  }
}

class Anime {
  final AnimeNode node;
  final Ranking? ranking;

  const Anime({
    required this.node,
    this.ranking,
  });

  factory Anime.fromJson(Map<String, dynamic> json) {
    return Anime(
      node: AnimeNode.fromJson(json['node']),
      ranking:
          json['ranking'] != null ? Ranking.fromJson(json['ranking']) : null,
    );
  }
}

class Ranking {
  final int rank;

  const Ranking({
    required this.rank,
  });

  factory Ranking.fromJson(Map<String, dynamic> json) {
    return Ranking(
      rank: json['rank'],
    );
  }
}

//...

class RelatedManga {
  final RelatedNode node;
  final String relationType;

  RelatedManga({required this.node, required this.relationType});

  factory RelatedManga.fromJson(Map<String, dynamic> json) {
    return RelatedManga(
      node: RelatedNode.fromJson(json['node']),
      relationType: json['relation_type'],
    );
  }
}

class Recommendation {
  final RelatedNode node;
  final int numRecommendations;

  Recommendation({required this.node, required this.numRecommendations});

  factory Recommendation.fromJson(Map<String, dynamic> json) {
    return Recommendation(
      node: RelatedNode.fromJson(json['node']),
      numRecommendations: json['num_recommendations'],
    );
  }
}

class Studio {
  final int id;
  final String name;

  Studio({required this.id, required this.name});

  factory Studio.fromJson(Map<String, dynamic> json) {
    return Studio(
      id: json['id'],
      name: json['name'],
    );
  }
}

class Statistics {
  final Status status;
  final int numListUsers;

  Statistics({required this.status, required this.numListUsers});

  factory Statistics.fromJson(Map<String, dynamic> json) {
    return Statistics(
      status: Status.fromJson(json['status']),
      numListUsers: json['num_list_users'],
    );
  }
}

class Status {
  final String watching;
  final String completed;
  final String onHold;
  final String dropped;
  final String planToWatch;

  Status({
    required this.watching,
    required this.completed,
    required this.onHold,
    required this.dropped,
    required this.planToWatch,
  });

  factory Status.fromJson(Map<String, dynamic> json) {
    return Status(
      watching: json['watching'],
      completed: json['completed'],
      onHold: json['on_hold'],
      dropped: json['dropped'],
      planToWatch: json['plan_to_watch'],
    );
  }
}

class AnimeCategory {
  final String title;
  final String rankingType;

  const AnimeCategory({
    required this.title,
    required this.rankingType,
  });

  factory AnimeCategory.fromJson(Map<String, dynamic> json) {
    return AnimeCategory(
      title: json['title'],
      rankingType: json['rankingType'],
    );
  }
}
