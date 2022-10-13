// import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../utils/colors.dart';

class CommonFunction {
  static blankSpace(
      BuildContext context, double desiredHeight, double desiredWidth) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SizedBox(
      height: height * desiredHeight,
      width: width * desiredWidth,
    );
  }

  static showReportUnderWayDialog(
      BuildContext context, double height, double width) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          actions: [],
          content: Container(
            height: height * 0.33,
            width: width,
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(
                20,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  right: 0,
                  child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: FaIcon(
                        FontAwesomeIcons.xmark,
                        // size: 30,
                      )),
                ),
                Column(
                  children: [
                    Text(
                      'Send Report',
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                            color: textColorDarkLiver,
                          ),
                    ),
                    CommonFunction.blankSpace(context, 0.01, 0),
                    SvgPicture.asset(
                      'assets/images/reportUnderway.svg',
                      width: width * 0.32,
                    ),
                    Text(
                      'Report is underway',
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                            color: textColorDarkLiver,
                          ),
                    ),
                    CommonFunction.blankSpace(context, 0.03, 0),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                        CommonFunction.showToastMessage(
                            context, 'Your report will be Ready soon.');
                      },
                      child: Container(
                        height: height * 0.07,
                        width: width,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: greyShade6E7777,
                        ),
                        child: Text(
                          'Ok',
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(color: white),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static showReportReadyDialog(
    BuildContext context,
    double height,
    double width,
  ) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Container(
            height: height * 0.35,
            width: width,
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(
                20,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  right: 0,
                  child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: FaIcon(
                        FontAwesomeIcons.xmark,
                        // size: 30,
                      )),
                ),
                Column(
                  children: [
                    Text(
                      'Send Report',
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                            color: textColorDarkLiver,
                          ),
                    ),
                    CommonFunction.blankSpace(context, 0.01, 0),
                    SvgPicture.asset(
                      'assets/images/reportReady.svg',
                      width: width * 0.28,
                    ),
                    Text(
                      'Report is Ready',
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                            color: textColorDarkLiver,
                          ),
                    ),
                    CommonFunction.blankSpace(context, 0.03, 0),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        CommonFunction.showToastMessage(
                            context, 'Email sent successful!');
                      },
                      child: Container(
                        height: height * 0.07,
                        width: width,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: greenShade,
                        ),
                        child: Text(
                          'Send email',
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(color: white),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static showReportSentDialog(
    BuildContext context,
    double height,
    double width,
  ) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Container(
            height: height * 0.35,
            width: width,
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(
                20,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  right: 0,
                  child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: FaIcon(
                        FontAwesomeIcons.xmark,
                        // size: 30,
                      )),
                ),
                Column(
                  children: [
                    Text(
                      'Send Report',
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                            color: textColorDarkLiver,
                          ),
                    ),
                    CommonFunction.blankSpace(context, 0.01, 0),
                    SvgPicture.asset(
                      'assets/images/reportSent.svg',
                      width: width * 0.28,
                    ),
                    Text(
                      'Report sent Successful',
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                            color: textColorDarkLiver,
                          ),
                    ),
                    CommonFunction.blankSpace(context, 0.03, 0),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        CommonFunction.showToastMessage(
                            context, 'Email sent successful!');
                      },
                      child: Container(
                        height: height * 0.07,
                        width: width,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: greenShade,
                        ),
                        child: Text(
                          'Resend now',
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(color: white),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static showToastMessage(BuildContext context, String message) {
    return showToast(message,
        context: context,
        animation: StyledToastAnimation.scale,
        reverseAnimation: StyledToastAnimation.fade,
        position: StyledToastPosition.top,
        animDuration: Duration(seconds: 1),
        duration: Duration(seconds: 4),
        curve: Curves.elasticOut,
        reverseCurve: Curves.linear,
        backgroundColor: greenShade);
  }
}

// Currency formatter
final oCcy = new NumberFormat("#,##0.00", "en_US");
