import 'package:flutter/material.dart';
import 'package:flutter_circular_text/circular_text.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ui_app/apps/montblanc_app/pages/detail/detail_page.dart';
import 'package:flutter_ui_app/global/responsive.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    final statusBarHeight = MediaQuery.of(context).padding.bottom;
    return Scaffold(
      backgroundColor: const Color(0xff060507),
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (_) {
          _.disallowGlow();
          return true;
        },
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SafeArea(
                bottom: false,
                child: SizedBox(
                  height: 420,
                  width: double.infinity,
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: 0,
                        child: GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => DetailPage(),
                              )),
                          child: SizedBox(
                            height: 400,
                            width: responsive.width,
                            child: const SizedBox(
                              width: double.infinity,
                              child: Image(
                                  fit: BoxFit.fitWidth,
                                  image: AssetImage(
                                      'assets/montblanc_app/images/motorcycle.png')),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        child: Container(
                          width: responsive.width,
                          padding: const EdgeInsets.only(top: 15),
                          alignment: Alignment.center,
                          child: SvgPicture.asset(
                            'assets/montblanc_app/images/logo.svg',
                            height: 35,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        child: Container(
                          width: responsive.width,
                          alignment: Alignment.center,
                          child: CircularText(
                            children: [
                              TextItem(
                                text: Text(
                                  'MOTORCYCLE MONTBLANK',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 15,
                                    color: const Color(0xffFFFFFF),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                space: 17.5,
                                startAngle: 0,
                                startAngleAlignment: StartAngleAlignment.center,
                                direction: CircularTextDirection.clockwise,
                              ),
                            ],
                            radius: 70,
                            position: CircularTextPosition.inside,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 40, bottom: 20),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  alignment: Alignment.centerLeft,
                  child: Text('MONTBLANC MOTORCYCLE',
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 18))),
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  margin: EdgeInsets.only(bottom: statusBarHeight + 20),
                  alignment: Alignment.centerLeft,
                  child: Text(
                      '''The Montblanc Motorcycle comes with the same, uber-luxurious design language seen in the company’s pens. I’m talking clean surfaces, gloss black paint-job with the judicious use of metallic accents. My favorite detail, however, has to be the bike’s headlamp, which directly borrows its design from Montblanc’s pen-caps and watch crowns. The lamp comes with a rounded conical glass cover under which sits Montblanc’s famous star-shaped logo. The edge of the headlamp sports a metallic rim too, with protrusions on the side that make way for the bike’s indicators features that directly resemble the crown seen on Montblanc’s watches.''',
                      style: GoogleFonts.montserrat(
                          fontSize: 12,
                          height: 2,
                          color: Colors.white,
                          fontWeight: FontWeight.w200))),
            ],
          ),
        ),
      ),
    );
  }
}
