import 'package:flutter/material.dart';
import 'package:my_planbook/providers/json_provider.dart';
import 'package:my_planbook/screens/event_preview.dart';
import 'package:my_planbook/screens/login.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:my_planbook/widgets/change_theme_button.dart';
import 'package:my_planbook/widgets/drawer_custom.dart';
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
  late PageController pageViewController;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  dynamic consumer;
  late List<dynamic> recom = [];

  _HomeState(this.consumer) {
    JsonProvider.loadData(JsonProvider.EVENT, (data) => (
      setState(() => (
        recom = [...(data as List<dynamic>)].sublist(0, 3)
      ))
    ));
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
                          Text('Recomendaciones', style: GoogleFonts.poppins(fontSize: 20),
                          ),
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
                                    children: [...recom.map((r) => InkWell(
                                        onTap: () async {
                                          await Navigator.push(
                                            context,
                                            PageTransition(
                                              type: PageTransitionType.rightToLeft,
                                              duration: Duration(milliseconds: 500),
                                              reverseDuration: Duration(milliseconds: 500),
                                              child: EventPreview(r),
                                            ),
                                          );
                                        },
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Image.network(
                                              'https://picsum.photos/seed/70/600',
                                              width: double.infinity,
                                              height: 100,
                                              fit: BoxFit.fitWidth,
                                            ),
                                            Text(
                                              r['title'],
                                              style: TextStyle(),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Flexible(
                                                  child: ConstrainedBox(
                                                    constraints: BoxConstraints(maxWidth: 160),
                                                    child: Text(
                                                      r['details']['location']['place'],
                                                      style: GoogleFonts.poppins(color: Color(0xFF818181)),
                                                      overflow: TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  r['details']['date'],
                                                  style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    color: Color(0xFF818181),
                                                  ),
                                                ),
                                                Text(
                                                  '\$100.000',
                                                  style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    color: Color(0xFF818181),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ))
                                    ]
                                    // [
                                    //   InkWell(
                                    //     onTap: () async {
                                    //       await Navigator.push(
                                    //         context,
                                    //         MaterialPageRoute(
                                    //           builder: (context) =>
                                    //               EventPreview(),
                                    //         ),
                                    //       );
                                    //     },
                                    //     child: Column(
                                    //       mainAxisSize: MainAxisSize.max,
                                    //       children: [
                                    //         Image.network(
                                    //           'https://picsum.photos/seed/70/600',
                                    //           width: double.infinity,
                                    //           height: 100,
                                    //           fit: BoxFit.fitWidth,
                                    //         ),
                                    //         Text(
                                    //           'Nombre Evento',
                                    //           style: TextStyle(),
                                    //         ),
                                    //         Row(
                                    //           mainAxisSize: MainAxisSize.max,
                                    //           mainAxisAlignment:
                                    //               MainAxisAlignment.spaceEvenly,
                                    //           children: [
                                    //             Text(
                                    //               'Lugar',
                                    //               style: TextStyle(
                                    //                 fontFamily: 'Poppins',
                                    //                 color: Color(0xFF818181),
                                    //               ),
                                    //             ),
                                    //             Text(
                                    //               'Fecha',
                                    //               style: TextStyle(
                                    //                 fontFamily: 'Poppins',
                                    //                 color: Color(0xFF818181),
                                    //               ),
                                    //             ),
                                    //             Text(
                                    //               '\$100.000',
                                    //               style: TextStyle(
                                    //                 fontFamily: 'Poppins',
                                    //                 color: Color(0xFF818181),
                                    //               ),
                                    //             ),
                                    //           ],
                                    //         ),
                                    //       ],
                                    //     ),
                                    //   ),
                                    //   InkWell(
                                    //     onTap: () async {
                                    //       await Navigator.push(
                                    //         context,
                                    //         MaterialPageRoute(
                                    //           builder: (context) =>
                                    //               EventPreview(),
                                    //         ),
                                    //       );
                                    //     },
                                    //     child: Column(
                                    //       mainAxisSize: MainAxisSize.max,
                                    //       children: [
                                    //         Image.network(
                                    //           'https://picsum.photos/seed/70/600',
                                    //           width: double.infinity,
                                    //           height: 100,
                                    //           fit: BoxFit.fitWidth,
                                    //         ),
                                    //         Text(
                                    //           'Nombre Evento',
                                    //           style: TextStyle(),
                                    //         ),
                                    //         Row(
                                    //           mainAxisSize: MainAxisSize.max,
                                    //           mainAxisAlignment:
                                    //               MainAxisAlignment.spaceEvenly,
                                    //           children: [
                                    //             Text(
                                    //               'Lugar',
                                    //               style: TextStyle(
                                    //                 fontFamily: 'Poppins',
                                    //                 color: Color(0xFF818181),
                                    //               ),
                                    //             ),
                                    //             Text(
                                    //               'Fecha',
                                    //               style: TextStyle(
                                    //                 fontFamily: 'Poppins',
                                    //                 color: Color(0xFF818181),
                                    //               ),
                                    //             ),
                                    //             Text(
                                    //               '\$100.000',
                                    //               style: TextStyle(
                                    //                 fontFamily: 'Poppins',
                                    //                 color: Color(0xFF818181),
                                    //               ),
                                    //             ),
                                    //           ],
                                    //         ),
                                    //       ],
                                    //     ),
                                    //   ),
                                    //   InkWell(
                                    //     onTap: () async {
                                    //       await Navigator.push(
                                    //         context,
                                    //         MaterialPageRoute(
                                    //           builder: (context) =>
                                    //               EventPreview(),
                                    //         ),
                                    //       );
                                    //     },
                                    //     child: Column(
                                    //       mainAxisSize: MainAxisSize.max,
                                    //       children: [
                                    //         Image.network(
                                    //           'https://picsum.photos/seed/70/600',
                                    //           width: double.infinity,
                                    //           height: 100,
                                    //           fit: BoxFit.fitWidth,
                                    //         ),
                                    //         Text(
                                    //           'Nombre Evento',
                                    //           style: TextStyle(),
                                    //         ),
                                    //         Row(
                                    //           mainAxisSize: MainAxisSize.max,
                                    //           mainAxisAlignment:
                                    //               MainAxisAlignment.spaceEvenly,
                                    //           children: [
                                    //             Text(
                                    //               'Lugar',
                                    //               style: TextStyle(
                                    //                 fontFamily: 'Poppins',
                                    //                 color: Color(0xFF818181),
                                    //               ),
                                    //             ),
                                    //             Text(
                                    //               'Fecha',
                                    //               style: TextStyle(
                                    //                 fontFamily: 'Poppins',
                                    //                 color: Color(0xFF818181),
                                    //               ),
                                    //             ),
                                    //             Text(
                                    //               '\$100.000',
                                    //               style: TextStyle(
                                    //                 fontFamily: 'Poppins',
                                    //                 color: Color(0xFF818181),
                                    //               ),
                                    //             ),
                                    //           ],
                                    //         ),
                                    //       ],
                                    //     ),
                                    //   ),
                                    // ],
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0, 1),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 10),
                                    child: SmoothPageIndicator(
                                      controller: pageViewController =
                                          PageController(initialPage: 0),
                                      count: 3,
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
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text('My Planbook', style: GoogleFonts.poppins(fontSize: 20))
                        ],
                      ),
                      Container(
                        width: double.infinity,
                        height: 200,
                        child: ListView(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.vertical,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                              child: InkWell(
                                onTap: () async {
                                  // await Navigator.push(
                                  //   context,
                                  //   PageTransition(
                                  //     type: PageTransitionType.rightToLeft,
                                  //     duration: Duration(milliseconds: 500),
                                  //     reverseDuration:
                                  //         Duration(milliseconds: 500),
                                  //     child: EventPreview(),
                                  //   ),
                                  // );
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(4),
                                      child: Image.network(
                                        'https://picsum.photos/seed/799/600',
                                        width: 140,
                                        height: 100,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20, 0, 0, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Nombre Evento',
                                            style: TextStyle(),
                                          ),
                                          Text(
                                            'Fecha',
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              color: Color(0xFF818181),
                                            ),
                                          ),
                                          Text(
                                            'Lugar',
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              color: Color(0xFF818181),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                              child: InkWell(
                                onTap: () async {
                                  // await Navigator.push(
                                  //   context,
                                  //   PageTransition(
                                  //     type: PageTransitionType.rightToLeft,
                                  //     duration: Duration(milliseconds: 500),
                                  //     reverseDuration:
                                  //         Duration(milliseconds: 500),
                                  //     child: EventPreview(),
                                  //   ),
                                  // );
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(4),
                                      child: Image.network(
                                        'https://picsum.photos/seed/799/600',
                                        width: 140,
                                        height: 100,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20, 0, 0, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Nombre Evento',
                                            style: TextStyle(),
                                          ),
                                          Text(
                                            'Fecha',
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              color: Color(0xFF818181),
                                            ),
                                          ),
                                          Text(
                                            'Lugar',
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              color: Color(0xFF818181),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                              child: InkWell(
                                onTap: () async {
                                  // await Navigator.push(
                                  //   context,
                                  //   PageTransition(
                                  //     type: PageTransitionType.rightToLeft,
                                  //     duration: Duration(milliseconds: 500),
                                  //     reverseDuration:
                                  //         Duration(milliseconds: 500),
                                  //     child: EventPreview(),
                                  //   ),
                                  // );
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(4),
                                      child: Image.network(
                                        'https://picsum.photos/seed/799/600',
                                        width: 140,
                                        height: 100,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20, 0, 0, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Nombre Evento',
                                            style: TextStyle(),
                                          ),
                                          Text(
                                            'Fecha',
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              color: Color(0xFF818181),
                                            ),
                                          ),
                                          Text(
                                            'Lugar',
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              color: Color(0xFF818181),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
