import 'package:anime_app/Utils/colors.dart';
import 'package:anime_app/Widgets/home_page_widgets.dart';
import 'package:anime_app/screens/categories_page.dart';
import 'package:anime_app/screens/search_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _pageIndex = 0;
  final List<Widget> _pages = [
    const HomeScreen(),
    SearchPage(),
    const CategoryPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: bgColor,
        animationDuration: const Duration(milliseconds: 300),
        items: const [
          Icon(Icons.home),
          Icon(Icons.search),
          Icon(Icons.category)
        ],
        onTap: (index) {
          setState(() {
            _pageIndex = index;
          });
        },
      ),
      body: _pages[_pageIndex],
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            profileRow(),
            SizedBox(
              height: 5,
            ),
            homeTopCard(),
            SizedBox(
              height: 20,
            ),
            popularAnimes(),
            SizedBox(
              height: 30,
            ),
            seasonalAnimes()
          ],
        ),
      ),
    );
  }
}
