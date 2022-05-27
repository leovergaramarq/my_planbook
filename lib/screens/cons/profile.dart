import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_planbook/providers/theme_provider.dart';
import 'package:my_planbook/widgets/drawer_custom.dart';

class Profile extends StatefulWidget {
  final dynamic consumer;
  const Profile(this.consumer, {Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState(consumer);
}

class _ProfileState extends State<Profile> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  dynamic consumer;
  final fields = const [
    ['Nombre', 'firstname'],
    ['Apellidos', 'lastname'],
    ['Email', 'email'],
    ['Doc. Identidad', 'idDoc'],
    ['Username', 'username'],
  ];
  
  _ProfileState(this.consumer);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: AppColors.purple,
        automaticallyImplyLeading: false,
        title: Text(
          'Profile',
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
      drawer: DrawerCustom(consumer, 'cons'),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 160,
                          height: 160,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.network(
                            'https://picsum.photos/seed/777/600',
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(18, 0, 0, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                consumer['firstname'],
                                style: GoogleFonts.poppins(fontSize: 22,),
                              ),
                              Text(
                                consumer['lastname'],
                                style: GoogleFonts.poppins(fontSize: 22,),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 16, 10, 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                        child: Text(
                          'Información General',
                          style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 200,
                        constraints: BoxConstraints(
                          maxWidth: double.infinity,
                        ),
                        decoration: BoxDecoration(
                          // color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                          child: ListView(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.vertical,
                            children: [
                              ...fields.map((f) => Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(f[0], style: GoogleFonts.poppins(fontSize: 16)),
                                    Text(consumer[f[1]].toString(), style: GoogleFonts.poppins(fontSize: 16)),
                                  ],
                                ),
                              ),)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 16, 10, 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                        child: Text(
                          'Métodos de Pago',
                          style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 120,
                        constraints: BoxConstraints(
                          maxWidth: double.infinity,
                        ),
                        decoration: BoxDecoration(
                          // color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                          child: ListView(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.vertical,
                            children: [...consumer['paymentMethods'].map((m) => Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(m['name'], style: GoogleFonts.poppins(fontSize: 16)),
                                    TextButton(
                                      onPressed: () {
                                        print('Button pressed ...');
                                      },
                                      child: Text('Editar'),
                                    ),
                                  ],
                                ),
                              )),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        print('Button pressed ...');
                                      },
                                      child: Text('Añadir'),
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
        ),
      ),
    );
  }
}
