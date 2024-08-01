import 'package:anime_app/Utils/colors.dart';
import 'package:anime_app/Widgets/details_page_widgets.dart';
import 'package:anime_app/api/get_anime_detail_api.dart';
import 'package:flutter/material.dart';

import 'package:anime_app/models/anime.dart';

class DetailsPage extends StatefulWidget {
  final int animeId;

  const DetailsPage({super.key, required this.animeId});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late Future<AnimeDetails> _animeDetails;

  @override
  void initState() {
    super.initState();
    _animeDetails = getAnimeDetailsApi(id: widget.animeId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: FutureBuilder<AnimeDetails>(
        future: _animeDetails,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            var animeDetails = snapshot.data!;
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 50.0, horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    appBar(context),
                    SizedBox(
                      height: 10,
                    ),
                    const SizedBox(height: 5),
                    row1(animeDetails.title, animeDetails.status,
                        animeDetails.startDate),
                    const SizedBox(height: 16),
                    picture(
                        animeDetails.mainPicture?.large ?? '', double.infinity),
                    const SizedBox(height: 16),
                    genreList(animeDetails.genres ?? []),
                    const SizedBox(height: 8),
                    starReview(animeDetails.mean,
                        animeDetails.num_scoring_users, animeDetails.ep),
                    const SizedBox(
                      height: 10,
                    ),
                    description(animeDetails.description),
                    SizedBox(
                      height: 20,
                    ),
                    relatedAnimes(animeDetails.relatedAnime ?? [], context),
                  ],
                ),
              ),
            );
          } else {
            return const Center(
              child: Text('No data available'),
            );
          }
        },
      ),
    );
  }
}
