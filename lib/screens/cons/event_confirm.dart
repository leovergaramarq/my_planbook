import 'package:my_planbook/providers/theme_provider.dart';

import 'package:my_planbook/main.dart';
import 'package:my_planbook/screens/cons/search.dart';
import 'package:my_planbook/widgets/payment_method.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EventConfirm extends StatefulWidget {

  dynamic event;
  final int selOption;
  final String currency;

  EventConfirm(this.event, this.selOption, this.currency, {Key? key}) : super(key: key);

  @override
  _EventConfirmState createState() => _EventConfirmState(event, selOption, currency);
}

class _EventConfirmState extends State<EventConfirm> {
  late String radioButtonValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  dynamic event;
  final int selOption;
  late int selPM;
  late String currency;

  _EventConfirmState(this.event, this.selOption, this.currency) {
    selPM = -1;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> info = [];

    info.add(
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
      )
    );

    info.add(
      Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Organizador: ',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  event['provider']['name'],
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: AppColors.grey,
                    fontSize: 16
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Lugar: ', style: TextStyle(fontSize: 16)),
                Text(
                  event['details']['location']['place'],
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: AppColors.grey,
                    fontSize: 16
                  ),
                ),
              ],
            ),
          ],
        ),
      )
    );

    info.add(
      Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Opción ${selOption + 1}',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 18,
              ),
            ),
            Text(
              event['details']['options'][selOption]['name'],
              style: TextStyle(
                fontFamily: 'Poppins',
                color: AppColors.grey,
                fontSize: 16
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text('Valor: ', style: TextStyle(fontSize: 16)),
                Text(
                  event['details']['type'] == 'priv' ?
                    '${event['details']['options'][selOption]['price']} ${currency}'
                    :'Gratuito',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: AppColors.grey,
                    fontSize: 16
                  ),
                )
              ],
            ),
          ],
        ),
      )
    );

    if(event['details']['type'] == 'priv') {
      List<Widget> pms = (event['details']['payment']['methods'] as List<dynamic>)
      .map((pm) => (PaymentMethod(pm))).toList();
      
      Widget ListPM = Card(
        child: ListView.builder(
            itemCount: pms.length,
            itemBuilder: (_, index) {
              final tp = Provider.of<ThemeProvider>(context);

              return ListTile(
                title: pms[index],
                tileColor: selPM == index ? 
                  tp.isDarkTheme ? AppColors.greyDark : AppColors.greyLight
                  : null,
                
                onTap: () => setState(() => (
                  selPM = selPM == index ? -1 : index
                )),
              );
            },
          ),
      );

      info.add(
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 10),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Métodos de Pago',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 24,
                ),
              ),
              Container(
                width: 100,
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListPM
              ),
            ],
          ),
        )
      );
    }

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: AppColors.purple,
        automaticallyImplyLeading: false,
        leading: IconButton(
          splashColor: Colors.transparent,
          splashRadius: 30,
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
        centerTitle: false,
        elevation: 2,
      ),
      // backgroundColor: Color.fromRGBO(241, 244, 248, 1),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.network(
                'https://picsum.photos/seed/659/600',
                width: 100,
                height: 120,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: info,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          // ElevatedButton.icon(
                          //   onPressed: () async {
                          //     Navigator.pop(context, false);
                          //   },
                          //   label: Text('Regresar'),
                          //   icon: Icon(
                          //     Icons.chevron_left,
                          //     size: 18,
                          //   ),
                          // ),
                          ElevatedButton(
                            onPressed: selPM != -1  || event['details']['type'] == 'com' ?
                            () {
                              Navigator.pop(context, true);
                            }:null,
                            child: Text(
                              'Confirmar${event['details']['type'] == 'priv' ? ' Pago' : ''}'
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
