import 'package:anime_app/Utils/colors.dart';
import 'package:anime_app/models/class.dart';
import 'package:anime_app/screens/details_page.dart';
import 'package:anime_app/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

appBar(BuildContext context) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: buttonColor.withOpacity(0.4),
          border: Border.all(color: black),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
            );
          },
          child: Icon(
            Icons.arrow_left_outlined,
            size: 30,
            color: white,
          ),
        ),
      ),
      SizedBox(
        width: 15,
      ),
      Text(
        "Anime Details",
        style: TextStyle(
            fontSize: 20, fontFamily: 'tarablus', fontWeight: FontWeight.w600),
      )
    ],
  );
}

row1(String animeTitle, String status, String startDate) {
  if (status == "finished_airing") {
    status = "FINISHED";
  }
  DateTime parsedDate = DateTime.parse(startDate);

  String formattedDate = DateFormat.yMMMEd().format(parsedDate);
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        animeTitle,
        style: TextStyle(
          letterSpacing: 2,
          fontSize: 20,
          fontWeight: FontWeight.w900,
          fontFamily: 'tarablus',
        ),
      ),
      SizedBox(
        height: 5,
      ),
      Row(
        children: [
          Container(
            width: 130,
            height: 30,
            decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                      color: const Color.fromARGB(255, 135, 254, 139),
                      blurRadius: 0.8)
                ]),
            child: Center(
              child: Text(
                status,
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            width: 220,
            height: 30,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 245, 245, 36),
                borderRadius: BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                      color: Color.fromARGB(255, 223, 198, 4), blurRadius: 0.8)
                ]),
            child: Center(
              child: Text(
                "Released  " + formattedDate,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 11, 6, 6)),
              ),
            ),
          ),
        ],
      ),
    ],
  );
}

picture(String pic, width) {
  return Center(
    child: Container(
      decoration: BoxDecoration(
          border: Border.all(width: 4, color: black),
          borderRadius: BorderRadius.circular(14)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(9),
        child: Image.network(
          pic,
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}

genreList(List<Genre> genres) {
  return Wrap(
    spacing: 10.0,
    runSpacing: 5.0,
    children: genres.map((genre) {
      return Chip(
        backgroundColor: Color.fromARGB(255, 255, 149, 239).withOpacity(0.6),
        label: Text(
          genre.name,
          style: TextStyle(color: Colors.black54),
        ),
      );
    }).toList(),
  );
}

starReview(double value, int numScoringUsers, int episodes) {
  double valueformatted = value / 2;
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(5, (index) {
              return Icon(
                index < valueformatted ? Icons.star : Icons.star_border,
                color: index < valueformatted
                    ? Color.fromARGB(255, 111, 1, 106)
                    : const Color.fromARGB(137, 0, 0, 0),
              );
            }),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            value.toString(),
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            '(${numScoringUsers.toString()})',
            style: TextStyle(
                color: Colors.black54,
                fontSize: 17,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Text(
          episodes.toString() + ' ep',
          style: TextStyle(
              color: Color.fromARGB(255, 67, 2, 28),
              fontSize: 17,
              fontWeight: FontWeight.bold),
        ),
      ),
    ],
  );
}

description(String description) {
  return Column(
    children: [
      Text(
        description,
        style: TextStyle(
            fontSize: 15,
            letterSpacing: 1,
            wordSpacing: 1,
            fontWeight: FontWeight.w600,
            color: Color.fromARGB(255, 8, 0, 0)),
      )
    ],
  );
}

relatedAnimes(List<RelatedAnime> releatedanime, BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Related Animes",
        style: TextStyle(
            letterSpacing: 2,
            fontSize: 22,
            fontWeight: FontWeight.w900,
            fontFamily: 'tarablus',
            color: hText),
      ),
      SizedBox(
        height: 5,
      ),
      Wrap(
        spacing: 10,
        runSpacing: 6,
        children: releatedanime.map((releatedanime) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsPage(
                    animeId: releatedanime.node.id.toInt(),
                  ),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                  color: buttonColor.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all()),
              width: 120,
              height: 180,
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(19),
                    child: Image.network(
                      releatedanime.node.mainPicture.large,
                      width: 120,
                      height: 140,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      releatedanime.node.title,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
            ),
          );
        }).toList(),
      ),
    ],
  );
}
