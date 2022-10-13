// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:superlabs/utils/colors.dart';
import 'package:superlabs/view/landing_screen.dart';
import 'package:superlabs/view/widgets/company_signature.dart';

class EmailSentScreenFP extends StatelessWidget {
  const EmailSentScreenFP({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: authScreenColor,
      body: SafeArea(
        child: Center(
          child: Container(
            padding: EdgeInsets.only(
                left: width * 0.05, right: width * 0.05, top: height * 0.02),
            // height: 100.h,
            // width: 100.w,
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.03,
                ),
                SizedBox(
                  height: height * 0.15,
                  width: height * 0.15,
                  child: const Image(
                    image: AssetImage(
                      'assets/images/Black_logo.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  'Super easy | Super safe',
                  style: Theme.of(context).textTheme.headline4,
                ),
                SizedBox(
                  height: height * 0.09,
                ),
                const Image(
                    image: AssetImage('assets/images/envelop_logo.png')),
                SizedBox(
                  height: height * 0.03,
                ),
                Text(
                  'We have sent an email to you\ncheck your email now!',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline4,
                ),
                SizedBox(
                  height: height * 0.07,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: LandingScreen(),
                      ),
                    );
                  },
                  child: Container(
                    height: height * 0.075,
                    width: width,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: greenShade),
                    child: Text(
                      'Go to Login',
                      style: Theme.of(context)
                          .textTheme
                          .headline2!
                          .copyWith(color: white),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.23,
                ),
                CompanySignature()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
