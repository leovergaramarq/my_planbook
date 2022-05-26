import 'package:flutter/material.dart';
import 'package:my_planbook/providers/theme_provider.dart';
import 'package:my_planbook/widgets/drawer_custom.dart';

class Planbooks extends StatefulWidget {
  dynamic consumer;

  Planbooks(this.consumer, {Key? key}) : super(key: key);

  @override
  State<Planbooks> createState() => _PlanbooksState(consumer);
}

class _PlanbooksState extends State<Planbooks> {

  dynamic consumer;
  
  _PlanbooksState(this.consumer);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}