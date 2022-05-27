import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:my_planbook/providers/json_provider.dart';
import 'package:my_planbook/providers/theme_provider.dart';
import 'package:my_planbook/widgets/drawer_custom.dart';
import 'package:my_planbook/widgets/event_preview.dart';
import 'event_view.dart';
import 'package:page_transition/page_transition.dart';
import 'package:google_fonts/google_fonts.dart';

class Search extends StatefulWidget {
  final dynamic consumer;
  const Search(this.consumer, {Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState(consumer);
}

class _SearchState extends State<Search> {
  late String dropDownValue1;
  late String dropDownValue2;
  late TextEditingController searchController;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  dynamic consumer;
  List<dynamic> events = [];
  List<dynamic> eventsFilt = [];

  _SearchState(this.consumer) {
    JsonProvider.loadData(JsonProvider.EVENT, (data) {
      events = data as List<dynamic>;
      setState(() {
        eventsFilt = [...events];
      });
    });
  }

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  void filterEvents(String f) {
    setState(() {
      eventsFilt = events.where((e) => e['name'].toLowerCase().trim().contains(f.toLowerCase()))
        .toList();
    });
  }

  void clearSearch() {
    setState(
        () {
          searchController.clear();
          // filterEvents('');
          eventsFilt = [...events];
        },
    );
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: AppColors.purple,
        automaticallyImplyLeading: false,
        title: Text(
          'Búsqueda de Eventos',
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
            padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Form(
                  key: formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 0, 10, 0),
                                  child: TextFormField(
                                    controller: searchController,
                                    onChanged: (_) {
                                      filterEvents(_);
                                      return EasyDebounce.debounce(
                                        'searchController',
                                        Duration(milliseconds: 2000),
                                        () => setState(() {
                                          //print("ajsjhs");
                                        }),
                                      );
                                    },
                                    autofocus: true,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      hintText: 'Introduzca su búsqueda',
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: AppColors.greyLight,
                                          width: 1,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: AppColors.greyDark,
                                          width: 1,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              20, 0, 20, 0),
                                      suffixIcon: searchController.text.isNotEmpty
                                          ? InkWell(
                                              onTap: clearSearch,
                                              child: Icon(
                                                Icons.clear,
                                                color: AppColors.greyDark,
                                                size: 22,
                                              ),
                                            )
                                          : null,
                                    ),
                                    style: TextStyle(),
                                  ),
                                ),
                              ),
                              IconButton(
                                splashColor: Colors.transparent,
                                splashRadius: 30,
                                iconSize: 40,
                                icon: Icon(
                                  Icons.search,
                                  color: AppColors.grey,
                                  size: 20,
                                ),
                                onPressed: () {
                                  print('IconButton pressed ...');
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
                    child: ListView(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      children: eventsFilt.map((e) => Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                          child: EventPreview(e, 'cons'),
                        )).toList()
                    ),
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
