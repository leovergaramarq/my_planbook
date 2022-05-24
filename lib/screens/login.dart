import '../main.dart';
import './home.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_planbook/providers/json_provider.dart';

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
  // Map<String, dynamic> user = {};

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
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 80, 0, 40),
            child: ListView(
              // mainAxisSize: MainAxisSize.max,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.stretch,
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
                                style: TextStyle(

                                ),
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
                                style: TextStyle(),
                                keyboardType: TextInputType.visiblePassword,
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text('Restablecer Contraseña', style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                )),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  JsonProvider.loadData(JsonProvider.USER, (data) async {
                                    List<dynamic> users = data as List<dynamic>;
                                    final user = users.firstWhere((u) => (
                                      u['username'] == textController1.text &&
                                      u['password'] == textController2.text
                                    ), orElse: () => null);
                                    
                                    if(user == null) return;
                                    await Navigator.push(
                                      context,
                                      // MaterialPageRoute(builder: (context) => Home1())
                                      PageTransition(
                                        type: PageTransitionType.fade,
                                        duration: Duration(milliseconds: 500),
                                        reverseDuration:
                                            Duration(milliseconds: 500),
                                        child: Home(null),
                                        // child: NavBarPage(initialPage: 'Home'),
                                      ),
                                    );
                                  });
                                },
                                child: Text('Iniciar Sesión', style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                )),
                              ),
                              TextButton(
                                onPressed: () {
                                  
                                },
                                child: Text('Registrarse', style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                )),
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
