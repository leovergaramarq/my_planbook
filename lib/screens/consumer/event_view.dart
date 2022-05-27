import 'package:flutter/material.dart';
import 'package:my_planbook/providers/theme_provider.dart';
import 'package:my_planbook/widgets/event_option.dart';
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

    List<Widget> info = [];
    
    info.add(
      Row(
        children: [
          Text('Organizador: '),
          Text(
            event['provider']['name'],
            style: TextStyle(
              fontFamily: 'Poppins',
              color: AppColors.grey,
            ),
          ),
        ],
      )
    );

    if(event['details']['date'] != null) {
      info.add(
        Row(
          children: [
            Text('Fecha: '),
            Text(
              event['details']['date'],
              style: TextStyle(
                fontFamily: 'Poppins',
                color: AppColors.grey,
              ),
            ),
          ],
        )
      );
    }

    info.add(
      Row(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Ubicación'),
              Text(
                '${event['details']['location']['country']}, ${event['details']['location']['city']}',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: AppColors.grey,
                ),
              ),
              Text(
                event['details']['location']['place'],
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: AppColors.grey,
                ),
              ),
              Text(
                event['details']['location']['address'],
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: AppColors.grey,
                ),
              ),
            ],
          ),
        ],
      )
    );

    info.add(
      Row(
        children: [
          Flexible(
            child: 
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(text: 'Descripción: ', style: TextStyle(color: AppColors.black)),
                  TextSpan(
                    text: event['details']['description'],
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: AppColors.grey,
                    ),
                  ),
                ]
              ),
            )
          )
        ],
      )
    );

    // Map<int, dynamic> options = event['details']['options'].toList().asMap();
    List<dynamic> eventOp = event['details']['options'].toList();
    int n = eventOp.length;

    List<Widget> options = [];
    for(int i = 0; i < n; i++) options.add(EventOption(eventOp[i], i + 1));

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
            color: AppColors.white,
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
            color: AppColors.white,
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
                        children: info.map((e) => Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                          child: e,
                        )).toList(),
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
                            height: 260,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(14, 12, 14, 12),
                              child: ListView(
                                scrollDirection: Axis.vertical,
                                children: options.map((o) => (
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 14),
                                    child: o
                                  )
                                )).toList(),
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
