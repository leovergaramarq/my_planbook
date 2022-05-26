import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_planbook/providers/theme_provider.dart';
import 'package:my_planbook/screens/event_view.dart';
import 'package:page_transition/page_transition.dart';

class EventPreview extends StatelessWidget {
  dynamic event;
  EventPreview(this.event, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    List<Widget> info = [];
    
    info.add(Text(event['name'], style: GoogleFonts.poppins(color: AppColors.black)));
    if(event['details']['date'] != null)
      info.add(
        Text(
          event['details']['date'],
          style: GoogleFonts.poppins(color: AppColors.grey)
        )
      );
    info.add(Text(
        event['details']['location']['place'],
        style: GoogleFonts.poppins(color: AppColors.grey)
      )
    );
    info.add(
      // Text(
      //   (e['details']['options'] as List).where(),
      //   style: GoogleFonts.poppins(color: AppColors.grey)
      // ),
      Text('\$50.000 - \$100.000', style: GoogleFonts.poppins(color: AppColors.grey))
    );

    return InkWell(
      onTap: () async {
        await Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.rightToLeft,
            duration: Duration(milliseconds: 500),
            reverseDuration: Duration(milliseconds: 500),
            child: EventView(event),
          ),
        );
      },
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image.network(
                'https://picsum.photos/seed/799/600',
                width: 140,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: info,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
