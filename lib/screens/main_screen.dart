import './profile.dart';
import './search.dart';
import './home.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:my_planbook/providers/theme_provider.dart';

class main_screen extends StatefulWidget {
  const main_screen({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<main_screen> {
  late PageController pageViewController;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final NavigationKey = GlobalKey<CurvedNavigationBarState>();
  int ind = 1;

  final Screens = [
    Search(),
    Home(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      Icon(Icons.search, size: 30),
      Icon(Icons.home, size: 30),
      Icon(Icons.person_rounded, size: 30),
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Pagina 0"),
        elevation: 0,
      ),
      key: scaffoldKey,
      body: Screens[ind],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          iconTheme: IconThemeData(color: Colors.white),
        ),
        child: CurvedNavigationBar(
          key: NavigationKey,
          color: AppColors.purple,
          backgroundColor: Colors.transparent,
          height: 50,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 300),
          index: ind,
          items: items,
          onTap: (index) => setState(() => this.ind = index),
        ),
      ),
    );
  }
}
