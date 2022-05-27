import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_planbook/providers/theme_provider.dart';
import 'package:my_planbook/screens/general/login.dart';
import 'package:my_planbook/widgets/change_theme_button.dart';
import 'package:page_transition/page_transition.dart';

class DrawerCustom extends StatelessWidget {
  dynamic user;
  String role;

  DrawerCustom(this.user, this.role, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 16,
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(10, 60, 10, 30),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // ElevatedButton(onPressed: () => print(user), child: Text('asdas')),
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Hola,', style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w400),),
                          Text(
                            role == 'cons' ? user['firstname'] : user['name'],
                            style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.dark_mode_rounded), ChangeThemeButton(),
                      ],
                    )
                  ],
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                TextButton.icon(
                  onPressed: () => Navigator.pop(context),
                  label: Text('Cerrar Sesión',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.red,
                      )),
                  icon: Icon(
                    Icons.logout,
                    color: AppColors.red,
                    size: 15,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}