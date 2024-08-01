import 'package:anime_app/Utils/colors.dart';
import 'package:anime_app/api/get_animes_by_categories.dart';
import 'package:anime_app/api/get_seasonal_animes.dart';
import 'package:anime_app/models/class.dart';
import 'package:anime_app/screens/details_page.dart';
import 'package:flutter/material.dart';

profileRow() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 250, 152, 193),
                blurRadius: 5,
              )
            ],
          ),
          child: CircleAvatar(
              child: Image.asset("assets/images/avatar.png", fit: BoxFit.cover),
              maxRadius: 28),
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "senanur ",
              style: TextStyle(
                  fontFamily: 'disketMono',
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
            Text(
              "İncekara ",
              style: TextStyle(
                  fontFamily: 'disketMono',
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            )
          ],
        )
      ],
    ),
  );
}

homeTopCard() {
  return Center(
    child: Container(
      // color: Colors.amber,
      height: 180,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0, bottom: 5),
            child: Align(
              child: Container(
                width: 300,
                height: 140,
                decoration: BoxDecoration(
                  color: firstBox,
                  border: Border.all(color: firstBoxBorder),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              alignment: Alignment.bottomLeft,
            ),
          ),
          Align(
            child: Container(
              width: 350,
              decoration: BoxDecoration(
                  color: secondBox,
                  border: Border.all(color: secondBoxBorder),
                  borderRadius: BorderRadius.circular(20)),
              alignment: Alignment.centerLeft,
              height: 145,
              child: Padding(
                padding: const EdgeInsets.all(28.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "✨ Welcome to the ",
                      style: TextStyle(
                          fontFamily: 'tarablus',
                          fontWeight: FontWeight.w600,
                          fontSize: 20),
                    ),
                    Text(
                      "world of Anime! ✨",
                      style: TextStyle(
                          fontFamily: 'tarablus',
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 2.0, left: 15),
                      child: Row(
                        children: [
                          Icon(
                            Icons.favorite_rounded,
                            color: Colors.red,
                          ),
                          Icon(
                            Icons.favorite_rounded,
                            color: Colors.red,
                          ),
                          Icon(
                            Icons.favorite_rounded,
                            color: Colors.red,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 0.0,
            left: 240.0,
            child: Image.asset(
              "assets/images/img1.png",
              width: 180,
              height: 180,
            ),
          )
        ],
      ),
    ),
  );
}

popularAnimes() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        "MOST POPULAR 10 ANIMES",
        style: TextStyle(
            letterSpacing: -1.5,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'disketMono'),
      ),
      const SizedBox(height: 10),
      SizedBox(
        height: 270,
        child: FutureBuilder<List<Anime>>(
          future: getCategoricAnimeDetails(rankingType: 'all', limit: 10),
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
              var animes = snapshot.data!;
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: animes.length,
                itemBuilder: (context, index) {
                  var anime = animes[index];
                  var imageUrl = anime.node.mainPicture.large;
                  var title = anime.node.title;

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsPage(
                            animeId: anime.node.id.toInt(),
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 20),
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                          color: buttonColor.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all()),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              imageUrl,
                              width: 200,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              title,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.fade,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: Text('No data available'),
              );
            }
          },
        ),
      ),
    ],
  );
}

String selectedValue = 'SUMMER';

Widget seasonalAnimes() {
  return StatefulBuilder(
    builder: (BuildContext context, StateSetter setState) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                "TOP 10 ",
                style: TextStyle(
                  letterSpacing: -1.5,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'disketMono',
                ),
              ),
              DecoratedBox(
                decoration: ShapeDecoration(
                    color: buttonColor.withOpacity(0.4),
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                            width: 1.0, style: BorderStyle.solid, color: black),
                        borderRadius: BorderRadius.all(Radius.circular(15.0)))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 0.0),
                  child: DropdownButton<String>(
                    value: selectedValue,
                    items: ['SUMMER', 'WINTER', "SPRING", "FALL"]
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedValue = newValue!;
                      });
                    },
                  ),
                ),
              ),
              const Text(
                " ANIMES ",
                style: TextStyle(
                  letterSpacing: -1.5,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'disketMono',
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 270,
            child: FutureBuilder<List<Anime>>(
              future: getseasonalAnimeDetails(
                  limit: 10, year: 2024, season: selectedValue.toLowerCase()),
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
                  var seasonalAnimes = snapshot.data!;
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: seasonalAnimes.length,
                    itemBuilder: (context, index) {
                      var anime = seasonalAnimes[index];
                      var imageUrl = anime.node.mainPicture.large;
                      var title = anime.node.title;

                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailsPage(
                                animeId: anime.node.id,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 20),
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                              color: buttonColor.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all()),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  imageUrl,
                                  width: 200,
                                  height: 200,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  title,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  overflow: TextOverflow.fade,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: Text('No data available'),
                  );
                }
              },
            ),
          ),
        ],
      );
    },
  );
}
