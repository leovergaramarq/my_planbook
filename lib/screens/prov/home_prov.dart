import 'package:flutter/material.dart';
import 'package:my_planbook/providers/json_provider.dart';
import 'package:my_planbook/screens/general/login.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_planbook/screens/prov/event_new.dart';
import 'package:my_planbook/providers/theme_provider.dart';
import 'package:my_planbook/screens/general/login.dart';
import 'package:my_planbook/widgets/drawer_custom.dart';
import 'package:my_planbook/widgets/event_preview.dart';
import 'package:page_transition/page_transition.dart';

class HomeProv extends StatefulWidget {
  dynamic prov;
  
  HomeProv(this.prov, {Key? key}) : super(key: key);

  @override
  _HomeProvState createState() => _HomeProvState(prov);
}

class _HomeProvState extends State<HomeProv> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  List<dynamic> events = [];
  dynamic prov;

  _HomeProvState(this.prov) {
    JsonProvider.loadData(JsonProvider.EVENT, (data) {
      setState(() => (
        events = (data as List<dynamic>).
          where((e) => e['provider']['username'] == prov['username']).toList()
      ));
    });
  }

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
            color: AppColors.white
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
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 40, 20, 20),
            child: ListView(
              // mainAxisSize: MainAxisSize.max,
              // mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 20),
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
                                  prov['name'],
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
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                        child: Text(
                          'Eventos Organizados',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 300,
                        decoration: BoxDecoration(
                          // color: AppColors.white,
                        ),
                        child: ListView(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.vertical,
                          children: events.map((e) => Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(12, 8, 12, 8),
                            child: EventPreview(e, 'prov'),
                          )).toList(),
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
                        child: EventNew(),
                      ),
                    );
                  },
                  child: Text('Nuevo Evento'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
