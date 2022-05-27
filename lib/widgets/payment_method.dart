import 'package:flutter/material.dart';

class PaymentMethod extends StatelessWidget {
  dynamic pm;
  PaymentMethod(this.pm, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(12, 8, 12, 8),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(pm['name'])
        ]
      ),
    );
  }
}