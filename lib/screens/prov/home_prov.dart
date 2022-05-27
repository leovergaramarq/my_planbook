import 'package:flutter/material.dart';
import 'package:my_planbook/screens/general/login.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_planbook/screens/prov/NewEve.dart';
import 'package:my_planbook/providers/theme_provider.dart';
import 'package:my_planbook/screens/general/login.dart';
import 'package:my_planbook/widgets/drawer_custom.dart';
import 'package:page_transition/page_transition.dart';

class HomeProv extends StatefulWidget {
  dynamic prov;
  
  HomeProv(this.prov, {Key? key}) : super(key: key);

  @override
  _HomeProvState createState() => _HomeProvState(prov);
}

class _HomeProvState extends State<HomeProv> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  
  dynamic prov;
  _HomeProvState(this.prov);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: AppColors.purple,
        automaticallyImplyLeading: false,
        title: Text(
          'Inicio',
          style: TextStyle(
            fontFamily: 'Poppins',
            color: AppColors.purple
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      drawer: DrawerCustom(prov, 'prov'),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Align(
            alignment: AlignmentDirectional(0, 0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 40, 20, 20),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: 120,
                              height: 120,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.network(
                                'https://picsum.photos/seed/572/600',
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20, 0, 0, 0),
                                  child: Text(
                                    'Nombre HomeProv ',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Eventos Creados',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: double.infinity,
                          height: 300,
                          decoration: BoxDecoration(
                            color: Color(0xFFEEEEEE),
                          ),
                          child: ListView(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.vertical,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 10, 0, 10),
                                child: InkWell(
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.fade,
                                        duration: Duration(milliseconds: 500),
                                        reverseDuration:
                                            Duration(milliseconds: 500),
                                        /*child: NavBarPage(
                                            initialPage: 'EventPreview'),*/
                                        child: Eve(),
                                      ),
                                    );
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
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 10, 0, 10),
                                child: InkWell(
                                  onTap: () async {
                                    // await Navigator.push(
                                    //   context,
                                    //   PageTransition(
                                    //     type: PageTransitionType.rightToLeft,
                                    //     duration: Duration(milliseconds: 500),
                                    //     reverseDuration:
                                    //         Duration(milliseconds: 500),
                                    //     child: NavBarPage(
                                    //         initialPage: 'EventPreview'),
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
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 10, 0, 10),
                                child: InkWell(
                                  onTap: () async {
                                    // await Navigator.push(
                                    //   context,
                                    //   PageTransition(
                                    //     type: PageTransitionType.rightToLeft,
                                    //     duration: Duration(milliseconds: 500),
                                    //     reverseDuration:
                                    //         Duration(milliseconds: 500),
                                    //     child: NavBarPage(
                                    //         initialPage: 'EventPreview'),
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
                  ElevatedButton(
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          duration: Duration(milliseconds: 500),
                          reverseDuration: Duration(milliseconds: 500),
                          /*child: NavBarPage(
                                            initialPage: 'EventPreview'),*/
                          child: Eve(),
                        ),
                      );
                    },
                    child: Text('Nuevo Eventos'),
                    // options: FFButtonOptions(
                    //   width: 130,
                    //   height: 40,
                    //   color: FlutterFlowTheme.of(context).primaryColor,
                    //   textStyle:
                    //       FlutterFlowTheme.of(context).subtitle2.override(
                    //             fontFamily: 'Poppins',
                    //             color: Colors.white,
                    //           ),
                    //   borderSide: BorderSide(
                    //     color: Colors.transparent,
                    //     width: 1,
                    //   ),
                    //   borderRadius: 12,
                    // ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
