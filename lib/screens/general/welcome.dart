import 'package:my_planbook/widgets/change_theme_button.dart';

import './login.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_planbook/providers/theme_provider.dart';
import 'package:my_planbook/screens/prov/event_new.dart';
import 'package:provider/provider.dart';
import 'package:page_transition/page_transition.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      key: scaffoldKey,
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
                Container(),
                Container(
                  width: 100,
                  height: 100,
                  child: Image.asset(
                    'assets/img/logo_mp.png',
                    width: 100,
                    height: 100,
                    fit: BoxFit.contain,
                  ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          await Navigator.push(
                            context,
                            // MaterialPageRoute(builder: (context) => LogIn()),
                            PageTransition(
                              type: PageTransitionType.scale,
                              alignment: Alignment.bottomCenter,
                              duration: Duration(milliseconds: 500),
                              reverseDuration: Duration(milliseconds: 500),
                              child: LogIn(),
                            ),
                          );
                        },
                        // style: ElevatedButton.styleFrom(
                        //   onPrimary: Colors.white,
                        // ),
                        child: Text('Empezar',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                            )),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton.icon(
                            onPressed: () {},
                            icon: Icon(
                              FontAwesomeIcons.google,
                              color: AppColors.greyDark,
                            ),
                            label: Text('Continuar con Google',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                color: AppColors.greyDark,
                              )),
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
