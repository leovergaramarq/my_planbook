import 'package:my_planbook/providers/theme_provider.dart';

import '../main.dart';
import './search.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EventConfirm extends StatefulWidget {
  const EventConfirm({Key? key}) : super(key: key);

  @override
  _EventConfirmState createState() => _EventConfirmState();
}

class _EventConfirmState extends State<EventConfirm> {
  late String radioButtonValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: AppColors.purple,
        automaticallyImplyLeading: false,
        leading: IconButton(
          splashColor: Colors.transparent,
          splashRadius: 30,
          //borderWidth: 1,//aqui hay una vaina rara con los iconos revisar*********************************************************************************
          iconSize: 60,
          icon: Icon(
            Icons.arrow_back,
            color: Color(0xFFEFEFEF),
            size: 30,
          ),
          onPressed: () async {
            Navigator.pop(
              context,
              // PageTransition(
              //   type: PageTransitionType.leftToRight,
              //   duration: Duration(milliseconds: 500),
              //   reverseDuration: Duration(milliseconds: 500),
              //   //child: NavBarPage(initialPage: 'Search'),
              //   child: Search(null),
              // ),
            );
          },
        ),
        title: Text(
          'Evento',
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      // backgroundColor: Color.fromRGBO(241, 244, 248, 1),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.network(
                'https://picsum.photos/seed/659/600',
                width: 100,
                height: 120,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Event Name',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 24,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 10, 0),
                                  child: Text(
                                    'Organizador:',
                                    style: TextStyle(),
                                  ),
                                ),
                                Text(
                                  'Hello World',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF818181),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 10, 0),
                                  child: Text(
                                    'Lugar:',
                                    style: TextStyle(),
                                  ),
                                ),
                                Text(
                                  'Hello World',
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
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Opción 1',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            'Nombre Opción',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Color(0xFF818181),
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                                child: Text(
                                  'Precio:',
                                  style: TextStyle(),
                                ),
                              ),
                              Text(
                                '\$10000',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Color(0xFF818181),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Métodos de Pago',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 18,
                            ),
                          ),
                          Radio(
                            groupValue:
                                ['Nequi', 'Bancolombia', 'Daviplata'].toList(),
                            value: 'Nequi',
                            onChanged: (value) {
                              setState(
                                  () => radioButtonValue = value.toString());
                            },
                            splashRadius: 25,
                            // textStyle: TextStyle(
                            //   fontFamily: 'Poppins',//NO se que chingados con los radio button******************************************************************************************************
                            //   color: Colors.black,
                            // ),
                            //buttonPosition: RadioButtonPosition.left,
                            //direction: Axis.vertical,
                            hoverColor: Colors.blue,
                            focusColor: Color(0x8A000000),
                            toggleable: false,
                            //horizontalAlignment: WrapAlignment.start,
                            //verticalAlignment: WrapCrossAlignment.start,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton.icon(
                            onPressed: () async {
                              Navigator.pop(context);
                            },
                            label: Text('Regresar'),
                            icon: Icon(
                              Icons.chevron_left,
                              size: 18,
                            ),
                            // options: FFButtonOptions(
                            //   width: 120,
                            //   height: 30,
                            //   color: Color(0xFF874C9E),
                            //   textStyle: FlutterFlowTheme.of(context)
                            //       .subtitle2
                            //       .override(
                            //         fontFamily: 'Poppins',
                            //         color: Colors.white,
                            //         fontSize: 14,
                            //       ),
                            //   borderSide: BorderSide(
                            //     color: Colors.transparent,
                            //     width: 1,
                            //   ),
                            //   borderRadius: 10,
                            // ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              print('Button pressed ...');
                            },
                            child: Text('Confirmar Pago'),
                            // options: FFButtonOptions(
                            //   width: 180,
                            //   height: 40,
                            //   color: Color(0xFF874C9E),
                            //   textStyle: FlutterFlowTheme.of(context)
                            //       .subtitle2
                            //       .override(
                            //         fontFamily: 'Poppins',
                            //         color: Colors.white,
                            //       ),
                            //   borderSide: BorderSide(
                            //     color: Colors.transparent,
                            //     width: 1,
                            //   ),
                            //   borderRadius: 10,
                            // ),
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
    );
  }
}
