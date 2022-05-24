import 'package:my_planbook/widgets/change_theme_button.dart';

import './login.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_planbook/providers/theme_provider.dart';
import 'package:provider/provider.dart';

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
      // backgroundColor: Color.fromRGBO(241, 244, 248, 1),
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
                  child: ChangeThemeButton(),
                  // decoration: BoxDecoration(
                  //   color: Color.fromRGBO(241, 244, 248, 1),
                  // ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  // decoration: BoxDecoration(
                  //   color: Color.fromRGBO(241, 244, 248, 1),
                  // ),
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
                  // decoration: BoxDecoration(
                  //   color: Color.fromRGBO(241, 244, 248, 1),
                  // ),
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
                        style: ElevatedButton.styleFrom(
                          primary: AppColors.purple,
                          onPrimary: Colors.white,
                        ),
                        child: Text('Empezar', style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                        )),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton.icon(
                            onPressed: () {
                              
                            },
                            icon: Icon(
                              FontAwesomeIcons.google,
                              // color: Theme.of(context).text,
                            ),
                            label: Text('Continuar con Google', style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                            )),
                            // style: TextButton.styleFrom(primary: AppColors.grayDark),
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
