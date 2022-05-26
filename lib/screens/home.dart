import 'package:flutter/material.dart';
import 'package:my_planbook/providers/json_provider.dart';
import 'package:my_planbook/screens/event_view.dart';
import 'package:my_planbook/screens/login.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:my_planbook/screens/profile.dart';
import 'package:my_planbook/widgets/change_theme_button.dart';
import 'package:my_planbook/widgets/drawer_custom.dart';
import 'package:my_planbook/widgets/planbooks_preview.dart';
import 'package:my_planbook/widgets/recomendation.dart';
import 'package:page_transition/page_transition.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:my_planbook/providers/theme_provider.dart';
import 'package:my_planbook/widgets/change_theme_button.dart';

class Home extends StatefulWidget {
  final dynamic consumer;
  const Home(this.consumer, {Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState(consumer);
}

class _HomeState extends State<Home> {
  static const int NUM_RECOM = 3;

  late PageController pageViewController;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  dynamic consumer;
  late List<dynamic> recom;
  late dynamic planbook;

  _HomeState(this.consumer) {
    recom = [];
    planbook = {};

    JsonProvider.loadData(JsonProvider.EVENT, (data) => (
      setState(() => (
        recom = (data as List<dynamic>).sublist(0, NUM_RECOM)
      ))
    ));

    JsonProvider.loadData(JsonProvider.PLANBOOK, (data) {
      setState(() {
        planbook = (data as List<dynamic>)
          .firstWhere((p) => p['user'] == consumer['username'], orElse: () => null);
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.purple,
        automaticallyImplyLeading: false,
        title: Text(
          'Inicio',
          style: TextStyle(
            fontFamily: 'Poppins',
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      drawer: DrawerCustom(consumer),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 40, 20, 20),
            child: ListView(
              // mainAxisSize: MainAxisSize.max,
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text('Recomendaciones', style: GoogleFonts.poppins(fontSize: 20),),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        child: Container(
                          height: 200,
                          decoration: BoxDecoration(),
                          child: Container(
                            width: double.infinity,
                            height: 500,
                            child: Stack(
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 50),
                                  child: PageView(
                                    controller: pageViewController = PageController(initialPage: 0),
                                    scrollDirection: Axis.horizontal,
                                    children: recom.map((r) => Recomendation(r)).toList(),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0, 1),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                                    child: SmoothPageIndicator(
                                      controller: pageViewController,
                                      count: NUM_RECOM,
                                      axisDirection: Axis.horizontal,
                                      onDotClicked: (i) {
                                        pageViewController.animateToPage(
                                          i,
                                          duration: Duration(milliseconds: 500),
                                          curve: Curves.ease,
                                        );
                                      },
                                      effect: ExpandingDotsEffect(
                                        expansionFactor: 2,
                                        spacing: 8,
                                        radius: 16,
                                        dotWidth: 16,
                                        dotHeight: 16,
                                        dotColor: Color(0xFF9E9E9E),
                                        activeDotColor: Color(0xFFAD7AB5),
                                        paintStyle: PaintingStyle.fill,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                  child: planbook != null ? 
                    planbook.isNotEmpty ? 
                      PlanbooksPreview(planbook)
                      : null
                    : null,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
