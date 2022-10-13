// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:superlabs/constants/common_functions.dart';
import 'package:superlabs/utils/colors.dart';
import 'package:superlabs/view/forgot_password/reset_password_screen.dart';
import 'package:superlabs/view/widgets/custom_text_field.dart';

import '../widgets/company_signature.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({
    super.key,
  });
  TextEditingController userIdController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: authScreenColor,
      body: SafeArea(
        child: ListView(
          children: [
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.05, vertical: height * 0.02),
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
                    Text(
                      'Reset Password',
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(color: black),
                    ),
                    CommonFunction.blankSpace(context, 0.03, 0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'User ID',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        CustomTextField(
                          controller: userIdController,
                          hint: '',
                          requiredheight: height * 0.065,
                          requiredwidth: width,
                          borderColor: transparent,
                          borderWidth: 0,
                          obscureText: false,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.04,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: const ResetPasswordScreen(),
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
                          'Reset now',
                          style: Theme.of(context)
                              .textTheme
                              .headline2!
                              .copyWith(color: white),
                        ),
                      ),
                    ),
                    // Spacer(),
                    SizedBox(
                      height: height * 0.32,
                    ),
                    CompanySignature(),

                    SizedBox(
                      height: height * 0.02,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
