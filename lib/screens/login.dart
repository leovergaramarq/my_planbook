import '../main.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  late TextEditingController textController1;
  late TextEditingController textController2;
  late bool passwordVisibility;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  // _LogInState() {
  //   textController1 = TextEditingController();
  //   textController2 = TextEditingController();
  //   passwordVisibility = false;
  // }

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    passwordVisibility = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color.fromRGBO(241, 244, 248, 1),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 80, 0, 40),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  'assets/img/logo.png',
                  width: 100,
                  height: 100,
                  fit: BoxFit.contain,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(40, 0, 40, 0),
                  child: Form(
                    key: formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Container(
                      width: 100,
                      height: 270,
                      decoration: BoxDecoration(
                        color: Color(0xFFEEEEEE),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              TextFormField(
                                controller: textController1,
                                onChanged: (_) => EasyDebounce.debounce(
                                  'textController1',
                                  Duration(milliseconds: 2000),
                                  () => setState(() {}),
                                ),
                                autofocus: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Email',
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                ),
                                // style: TextStyle(

                                // ),
                                keyboardType: TextInputType.emailAddress,
                              ),
                              TextFormField(
                                controller: textController2,
                                onChanged: (_) => EasyDebounce.debounce(
                                  'textController2',
                                  Duration(milliseconds: 2000),
                                  () => setState(() {}),
                                ),
                                autofocus: true,
                                obscureText: !passwordVisibility,
                                decoration: InputDecoration(
                                  labelText: 'Contraseña',
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  suffixIcon: InkWell(
                                    onTap: () => setState(
                                      () => passwordVisibility =
                                          !passwordVisibility,
                                    ),
                                    child: Icon(
                                      passwordVisibility
                                          ? Icons.visibility_outlined
                                          : Icons.visibility_off_outlined,
                                      color: Color(0xFF757575),
                                      size: 22,
                                    ),
                                  ),
                                ),
                                // style: FlutterFlowTheme.of(context).bodyText1,
                                keyboardType: TextInputType.visiblePassword,
                              ),
                              TextButton(
                                onPressed: () {
                                  print('Button pressed ...');
                                },
                                child: Text('Restablecer Contraseña'),
                                // options: FFButtonOptions(
                                //   width: 180,
                                //   height: 40,
                                //   color: Color(0xFFEFEFEF),
                                //   textStyle: FlutterFlowTheme.of(context)
                                //       .subtitle2
                                //       .override(
                                //         fontFamily: 'Poppins',
                                //         color: Color(0xFF874C9E),
                                //         fontSize: 12,
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
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              ElevatedButton(
                                onPressed: () async {
                                  // await Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(builder: (context) => Home())
                                  //   // PageTransition(
                                  //   //   type: PageTransitionType.fade,
                                  //   //   duration: Duration(milliseconds: 500),
                                  //   //   reverseDuration:
                                  //   //       Duration(milliseconds: 500),
                                  //   //   child: NavBarPage(initialPage: 'Home'),
                                  //   // ),
                                  // );
                                },
                                child: Text('Iniciar Sesión'),
                                // options: FFButtonOptions(
                                //   width: 130,
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
                              TextButton(
                                onPressed: () {
                                  print('Button pressed ...');
                                },
                                child: Text('Registrarse'),
                                // options: FFButtonOptions(
                                //   width: 130,
                                //   height: 40,
                                //   color: Color(0xFFEFEFEF),
                                //   textStyle: FlutterFlowTheme.of(context)
                                //       .subtitle2
                                //       .override(
                                //         fontFamily: 'Poppins',
                                //         color: Color(0xFF874C9E),
                                //         fontSize: 12,
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
                  ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Color(0xFFEEEEEE),
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
