import './login.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color.fromRGBO(241, 244, 248, 1),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 40),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(241, 244, 248, 1),
                  ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(241, 244, 248, 1),
                  ),
                  child: Image.asset(
                    'assets/img/logo.png',
                    width: 100,
                    height: 100,
                    fit: BoxFit.contain,
                  ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(241, 244, 248, 1),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LogIn()),
                            // PageTransition(
                            //   type: PageTransitionType.scale,
                            //   alignment: Alignment.bottomCenter,
                            //   duration: Duration(milliseconds: 500),
                            //   reverseDuration: Duration(milliseconds: 500),
                            //   child: LogInWidget(),
                            // ),
                          );
                        },
                        child: Text('Empezar'),
                        // options: FFButtonOptions(
                        //   width: 130,
                        //   height: 40,
                        //   color: Color(0xFF874C9E),
                        //   textStyle:
                        //       FlutterFlowTheme.of(context).subtitle2.override(
                        //             fontFamily: 'Poppins',
                        //             color: Colors.white,
                        //           ),
                        //   borderSide: BorderSide(
                        //     color: Colors.transparent,
                        //     width: 1,
                        //   ),
                        //   borderRadius: 10,
                        // ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              print('Button pressed ...');
                            },
                            child: Text('Continuar con Google',)
                            // icon: FaIcon(
                            //   FontAwesomeIcons.google,
                            // ),
                            // options: FFButtonOptions(
                            //   width: 240,
                            //   height: 40,
                            //   color:
                            //       FlutterFlowTheme.of(context).primaryBtnText,
                            //   textStyle: FlutterFlowTheme.of(context)
                            //       .subtitle2
                            //       .override(
                            //         fontFamily: 'Poppins',
                            //         color: Color(0xFF30362F),
                            //       ),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
