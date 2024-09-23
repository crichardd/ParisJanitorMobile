import 'package:flutter/material.dart';
import 'package:paris_janitor/ScreensAndWidgets/HomeScreen/Widgets/SearchScreenWidgets/custom_search_bar.dart';
import 'package:paris_janitor/ScreensAndWidgets/HomeScreen/Widgets/SearchScreenWidgets/filter_bar.dart';
import 'package:paris_janitor/ScreensAndWidgets/HomeScreen/Widgets/SearchScreenWidgets/search_result.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomSearchBar(),
            FilterBar(),
            SearchResult()
          ],
        ),
      ),
    );
  }
}
