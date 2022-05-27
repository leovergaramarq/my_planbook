import 'package:flutter/material.dart';
import 'package:my_planbook/providers/theme_provider.dart';

class EventOption extends StatelessWidget {
  
  dynamic option;
  int numOp;

  EventOption(this.option, this.numOp, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> info = [];

    info.add(
      Text(
        'Opción ${numOp}',
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 18,
        ),
      )
    );
    
    info.add(
      Text(
        option['name'],
        style: TextStyle(
          fontFamily: 'Poppins',
          color: AppColors.grey,
        ),
      )
    );

    if(option['price'] != null)
      info.add(
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text('Precio: '),
            Text(
              '\$${option['price']}',
              style: TextStyle(
                fontFamily: 'Poppins',
                color: AppColors.grey,
              ),
            ),
          ],
        )
      );

    info.add(
      Row(
        children: [
          Flexible(
            child: 
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(text: 'Descripción: ', style: TextStyle(color: AppColors.black)),
                  TextSpan(
                    text: option['description'],
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: AppColors.grey,
                    ),
                  ),
                ]
              ),
            )
          )
        ],
      )
    );

    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: info,
    );
  }
}
