import 'package:flutter/material.dart';
import 'package:paris_janitor/ScreensAndWidgets/HomeScreen/Screens/profile_screen.dart';
import 'package:paris_janitor/ScreensAndWidgets/HomeScreen/Screens/search_screen.dart';
import 'package:paris_janitor/ScreensAndWidgets/HomeScreen/Screens/trips_screen.dart';
import 'package:paris_janitor/ScreensAndWidgets/HomeScreen/Screens/wishlist_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'messages_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int tabsIndex = 0;

  final tabs = const [
    SearchScreen(),
    WishlistScreen(),
    TripsScreen(),
    MessagesScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[tabsIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: tabsIndex,
        onTap: onBottomBarTap,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.search_outlined),
            label: AppLocalizations.of(context)!.search_icon_desc,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.favorite_border),
            label: AppLocalizations.of(context)!.wishlist_icon_desc,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.flight),
            label: AppLocalizations.of(context)!.trips_icon_desc,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.message_outlined),
            label: AppLocalizations.of(context)!.messages_icon_desc,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: AppLocalizations.of(context)!.profile_icon_desc,
          )
        ],
        selectedItemColor: Colors.pinkAccent.shade400,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
      ),
    );
  }

  void onBottomBarTap(int index) {
    setState(() {
      tabsIndex = index;
    });
  }
}
