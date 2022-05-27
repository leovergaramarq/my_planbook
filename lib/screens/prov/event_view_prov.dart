import 'package:flutter/material.dart';
import 'package:my_planbook/providers/theme_provider.dart';
import 'package:my_planbook/screens/general/login.dart';
import 'package:my_planbook/widgets/event_option.dart';
import 'package:my_planbook/screens/cons/event_confirm.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class EventViewProv extends StatefulWidget {
  dynamic event;
  EventViewProv(this.event, {Key? key}) : super(key: key);

  @override
  _EventViewProvState createState() => _EventViewProvState(event);
}

class _EventViewProvState extends State<EventViewProv> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  dynamic event;

  _EventViewProvState(this.event);

  @override
  Widget build(BuildContext context) {

    List<Widget> info = [];
    final String currency = event['details']['type'] == 'priv' ? 
      event['details']['payment']['currency'] : '';

    info.add(
      Row(
        children: [
          Text('Organizador: ', style: TextStyle(fontSize: 16)),
          Text(
            event['provider']['name'],
            style: TextStyle(
              fontFamily: 'Poppins',
              color: AppColors.grey,
              fontSize: 16
            ),
          ),
        ],
      )
    );

    if(event['details']['date'] != null) {
      info.add(
        Row(
          children: [
            Text('Fecha: ', style: TextStyle(fontSize: 16)),
            Text(
              event['details']['date'],
              style: TextStyle(
                fontFamily: 'Poppins',
                color: AppColors.grey,
                fontSize: 16
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
              Text('Ubicación', style: TextStyle(fontSize: 16)),
              Text(
                '${event['details']['location']['country']}, ${event['details']['location']['city']}',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: AppColors.grey,
                  fontSize: 16
                ),
              ),
              Text(
                event['details']['location']['place'],
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: AppColors.grey,
                  fontSize: 16
                ),
              ),
              Text(
                event['details']['location']['address'],
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: AppColors.grey,
                  fontSize: 16
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
                  TextSpan(
                    text: 'Descripción: ', 
                    style: TextStyle(
                      color: Theme.of(context).textTheme.bodyText2?.color,
                      fontSize: 16
                    )
                  ),
                  TextSpan(
                    text: event['details']['description'],
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: AppColors.grey,
                      fontSize: 16
                    ),
                  ),
                ]
              ),
            )
          )
        ],
      )
    );

    List<dynamic> eventOp = event['details']['options'].toList();
    int n = eventOp.length;

    List<Widget> options = [];
    for(int i = 0; i < n; i++)
      options.add(EventOption(eventOp[i], i + 1, currency));

    Widget ListOptions = Card(
      child: ListView.builder(
        itemCount: options.length,
        itemBuilder: (_, index) => ListTile(title: options[index])
      ),
    );

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
          child: ListView(
            // mainAxisSize: MainAxisSize.max,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
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
                          Flexible(
                            child: Text(
                              event['name'],
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 24,
                              ),
                            )
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
                            height: 240,
                            decoration: BoxDecoration(
                              // color: AppColors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            // child: ListView(children: options),
                            child: ListOptions
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
