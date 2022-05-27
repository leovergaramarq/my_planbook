import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_planbook/providers/theme_provider.dart';
import 'package:my_planbook/screens/login.dart';
import 'package:page_transition/page_transition.dart';

class Proveedor extends StatefulWidget {
  const Proveedor({Key? key}) : super(key: key);

  @override
  _ProveedorWidgetState createState() => _ProveedorWidgetState();
}

class _ProveedorWidgetState extends State<Proveedor> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF874C9E),
        automaticallyImplyLeading: false,
        title: Text(
          'Inicio',
          style: TextStyle(
            fontFamily: 'Poppins',
            color: AppColors
                .purple, //Un color*************************************************************************************
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      backgroundColor: Colors.blue,
      drawer: Drawer(
        elevation: 16,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10, 30, 10, 30),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(200, 0, 0, 0),
                    child: Text(
                      'Hola, Nombre Usuario',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  ElevatedButton.icon(
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          duration: Duration(milliseconds: 500),
                          reverseDuration: Duration(milliseconds: 500),
                          child: LogIn(),
                        ),
                      );
                    },
                    label: Text('Cerrar Sesión'),
                    icon: Icon(
                      Icons.logout,
                      size: 15,
                    ),
                    // options: FFButtonOptions(
                    //   width: 170,
                    //   height: 40,
                    //   color: Color(0xFFEFEFEF),
                    //   textStyle: TextStyle(
                    //     fontFamily: 'Poppins',
                    //     color: AppColors.purpleDark,
                    //   ),
                    //   borderSide: BorderSide(
                    //     color: Colors.transparent,
                    //     width: 1,
                    //   ),
                    //   borderRadius: 12,
                    // ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
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
                                    'Nombre proveedor ',
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
                                        type: PageTransitionType.scale,
                                        duration: Duration(milliseconds: 500),
                                        reverseDuration:
                                            Duration(milliseconds: 500),
                                        /*child: NavBarPage(
                                            initialPage: 'EventPreview'),*/
                                        child: LogIn(),
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
                    onPressed: () {
                      print('NuevoEventos pressed ...');
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
