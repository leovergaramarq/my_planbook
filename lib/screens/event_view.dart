import 'package:flutter/material.dart';
import 'package:my_planbook/providers/theme_provider.dart';
import './event_confirm.dart';
import 'package:google_fonts/google_fonts.dart';

class EventView extends StatefulWidget {
  dynamic event;
  EventView(this.event, {Key? key}) : super(key: key);

  @override
  _EventViewState createState() => _EventViewState(event);
}

class _EventViewState extends State<EventView> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  dynamic event;

  _EventViewState(this.event);

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
          //borderWidth: 1,
          iconSize: 60,
          icon: Icon(
            Icons.arrow_back,
            color: Color(0xFFEFEFEF),
            size: 30,
          ),
          onPressed: () async {
            Navigator.pop(context);
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
                height: 100,
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
                            event['name'],
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
                                    event['provider']['name'],
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
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Ubicación',
                                      style: TextStyle(),
                                    ),
                                    Text(
                                      '${event['details']['location']['country']}, ${event['details']['location']['city']}',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF818181),
                                      ),
                                    ),
                                    Text(
                                      event['details']['location']['address'],
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF818181),
                                      ),
                                    ),
                                    Text(
                                      event['details']['location']['place'],
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
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            width: 100,
                            height: 300,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                              child: ListView(
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.vertical,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 10, 0, 10),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 10, 0),
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
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 10, 0),
                                              child: Text(
                                                'Descripción:',
                                                style: TextStyle(),
                                              ),
                                            ),
                                            Text(
                                              'Descripción',
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
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 10, 0, 10),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Opción 2',
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
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 10, 0),
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
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 10, 0),
                                              child: Text(
                                                'Descripción:',
                                                style: TextStyle(),
                                              ),
                                            ),
                                            Text(
                                              'Descripción',
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
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 10, 0, 10),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Opción 3',
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
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 10, 0),
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
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 10, 0),
                                              child: Text(
                                                'Descripción:',
                                                style: TextStyle(),
                                              ),
                                            ),
                                            Text(
                                              'Descripción',
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
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              dynamic confirm = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EventConfirm(event),
                                ),
                              );
                              print("VIEW****************************************");
                              print(confirm == 'confirmed');
                              print(confirm.toString() == 'confirmed');
                            },
                            child: Text('Siguiente'),
                            // options: FFButtonOptions(
                            //   width: 120,
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
