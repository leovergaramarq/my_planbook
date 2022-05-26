import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_planbook/screens/event_preview.dart';
import 'package:page_transition/page_transition.dart';

class Recomendation extends StatelessWidget {
  dynamic event;
  
  Recomendation(this.event, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.rightToLeft,
            duration: Duration(milliseconds: 500),
            reverseDuration: Duration(milliseconds: 500),
            child: EventPreview(event),
          ),
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Image.network(
            'https://picsum.photos/seed/70/600',
            width: double.infinity,
            height: 100,
            fit: BoxFit.fitWidth,
          ),
          Text(
            event['title'],
            style: TextStyle(),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 160),
                  child: Text(
                    event['details']['location']['place'],
                    style: GoogleFonts.poppins(color: Color(0xFF818181)),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Text(
                event['details']['date'],
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Color(0xFF818181),
                ),
              ),
              Text(
                '\$100.000',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Color(0xFF818181),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}