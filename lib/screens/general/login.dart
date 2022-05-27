import 'package:my_planbook/providers/theme_provider.dart';
import 'package:my_planbook/screens/cons/main_screen.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:my_planbook/screens/prov/home_prov.dart';
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
  late TextEditingController userController;
  late TextEditingController passwordController;
  late bool passwordVisibility;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    userController = TextEditingController();
    passwordController = TextEditingController();
    passwordVisibility = false;
  }

  void login() {
    JsonProvider.loadData(JsonProvider.USER, (data) {
      List<dynamic> users = data as List<dynamic>;
      final user = users.firstWhere(
          (u) => ((u['username'] == userController.text ||
                  u['email'] == userController.text) &&
              u['password'] == passwordController.text),
          orElse: () => null);

      if (user == null) return;

      if(user['role'] == 'cons') {
        JsonProvider.loadData(JsonProvider.CONSUMER, (data) {
          List<dynamic> consumers = data as List<dynamic>;
          final cons =
              consumers.firstWhere((c) => (c['username'] == user['username']));
          
          Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.fade,
              duration: Duration(milliseconds: 500),
              reverseDuration: Duration(milliseconds: 500),
              child: MainScreen(cons),
            ),
          );
        });
        
      }else if(user['role'] == 'prov') {
        JsonProvider.loadData(JsonProvider.PROVIDER, (data) {
          List<dynamic> providers = data as List<dynamic>;
          final prov =
              providers.firstWhere((p) => (p['username'] == user['username']));
          
          Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.fade,
              duration: Duration(milliseconds: 500),
              reverseDuration: Duration(milliseconds: 500),
              child: HomeProv(prov),
            ),
          );
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 80, 0, 0),
            child: ListView(
              children: [
                Image.asset(
                  'assets/img/logo_mp.png',
                  width: 100,
                  height: 100,
                  fit: BoxFit.contain,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(40, 20, 40, 0),
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
                                controller: userController,
                                onChanged: (_) => EasyDebounce.debounce(
                                  'userController',
                                  Duration(milliseconds: 2000),
                                  () => setState(() {}),
                                ),
                                autofocus: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Usuario o email',
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
                                style: TextStyle(),
                                keyboardType: TextInputType.emailAddress,
                              ),
                              TextFormField(
                                controller: passwordController,
                                onChanged: (_) => EasyDebounce.debounce(
                                  'passwordController',
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
                                child: Text('Restablecer Contraseña',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.greyDark)),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              ElevatedButton(
                                onPressed: login,
                                child: Text('Iniciar Sesión',
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                    )),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text('Registrarse',
                                    style: GoogleFonts.poppins(
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
