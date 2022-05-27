import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlanbooksPreview extends StatelessWidget {
  dynamic planbook;

  PlanbooksPreview(this.planbook, {Key? key}) : super(key: key);

  @override
  Widget build (BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(planbook['name'], style: GoogleFonts.poppins(fontSize: 20))
          ],
        ),
        Container(
          width: double.infinity,
          height: 240,
          child: ListView(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            children: planbook['bookings'].map<Widget>((b) => PlanbooksPreviewElem(b)).toList()
          ),
        ),
      ],
    );
  }
}

class PlanbooksPreviewElem extends StatelessWidget {
  dynamic booking;
  
  PlanbooksPreviewElem(this.booking, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> info = [];
    
    info.add(
      Text(
        booking['name'],
        style: TextStyle(),
      )
    );
    if(booking['date'] != null)
      info.add(
        Text(
          booking['date'],
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Color(0xFF818181),
          ),
        )
      );
    info.add(Text(
      booking['place'],
      style: TextStyle(
        fontFamily: 'Poppins',
        color: Color(0xFF818181),
      ),
    ));
    
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
      child: InkWell(
        onTap: () async {
          // await Navigator.push(
          //   context,
          //   PageTransition(
          //     type: PageTransitionType.rightToLeft,
          //     duration: Duration(milliseconds: 500),
          //     reverseDuration:
          //         Duration(milliseconds: 500),
          //     child: bookingPreview(),
          //   ),
          // );
        },
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