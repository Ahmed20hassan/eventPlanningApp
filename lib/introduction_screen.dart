import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:todo/screens/auth/login_screen.dart';
import 'package:todo/theme/theme.dart';

class Onbording extends StatelessWidget {
  static const String routName = 'introduction';
  Onbording({super.key});
  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/images/${assetName}.png', width: width);
  }

  @override
  Widget build(BuildContext context) {
    var pageDecoration = PageDecoration(
      bodyFlex: 2,
      bodyTextStyle: TextStyle(
        color: Theme.of(context).dividerColor,
        fontSize: 16
      ),
      titleTextStyle: GoogleFonts.elMessiri(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).primaryColor),
      imageFlex: 6,
      pageColor: Theme.of(context).hintColor,
      bodyPadding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      imagePadding: EdgeInsets.zero,
    );
    return  IntroductionScreen(

        globalHeader: Padding(
          padding: const EdgeInsets.only(top: 24, bottom: 16),
          child: Image.asset(
            'assets/images/logo.png',
            alignment: Alignment.topCenter,
            height: 150,
          ),
        ),
        dotsFlex: 2,
        dotsDecorator:  DotsDecorator(
            activeColor:Theme.of(context).primaryColor,
          color: Theme.of(context).dividerColor
        ),

        done: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                border: Border.all(
                  width: 2,
                  color: Theme.of(context).primaryColor,
                )),
            child: Icon(
              Icons.arrow_forward,
              size: 20,
              color: Theme.of(context).primaryColor,
            )),
        onDone: () {
          Navigator.pushNamed(context, LogoScreen.routName);
        },
        next: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                border: Border.all(
                  width: 2,
                  color: Theme.of(context).primaryColor,
                )),
            child: Icon(
              Icons.arrow_forward,
              size: 20,
              color: Theme.of(context).primaryColor,
            )),
        back: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                border: Border.all(
                  width: 2,
                  color: Theme.of(context).primaryColor,
                )),
            child: Icon(
              Icons.arrow_back,
              size: 20,
              color: Theme.of(context).primaryColor,
            )),
        showBackButton: true,
        pages: [
          PageViewModel(
            title: "on_boarding1_title".tr(),
            body:
                "on_boarding1_body".tr(),
            image: _buildImage('introduction_1'),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "on_boarding2_title".tr(),
            body:
                "on_boarding2_body".tr(),
            image: _buildImage('introduction_2'),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "on_boarding3_title".tr(),
            body:
                "on_boarding3_bdy".tr(),
            image: _buildImage('introduction_3'),
            decoration: pageDecoration,
          ),
        ],

    );
  }
}
