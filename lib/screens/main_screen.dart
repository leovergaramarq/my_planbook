import 'package:my_planbook/screens/home.dart';
import 'package:my_planbook/screens/search.dart';
import 'package:my_planbook/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:my_planbook/providers/theme_provider.dart';

class MainScreen extends StatefulWidget {
  final dynamic consumer;
  const MainScreen(this.consumer, {Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState(consumer);
}

class _MainScreenState extends State<MainScreen> {
  late PageController pageViewController;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final NavigationKey = GlobalKey<CurvedNavigationBarState>();
  late final List screens;
  int ind = 1;
  dynamic consumer;

  _MainScreenState(this.consumer) {
    ind = 1;
    screens = [
      Search(consumer),
      Home(consumer),
      Profile(consumer),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: screens[ind],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          iconTheme: IconThemeData(color: AppColors.white),
        ),
        child: CurvedNavigationBar(
          key: NavigationKey,
          color: AppColors.purple,
          backgroundColor: Colors.transparent,
          height: 50,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 300),
          index: ind,
          items: [
            Icon(Icons.search, size: 30),
            Icon(Icons.home, size: 30),
            Icon(Icons.person_rounded, size: 30),
          ],
          onTap: (index) => setState(() => this.ind = index),
        ),
      ),
    );
  }
}
