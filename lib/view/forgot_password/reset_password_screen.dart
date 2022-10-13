import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:superlabs/constants/common_functions.dart';
import 'package:superlabs/utils/colors.dart';
import 'package:superlabs/view/forgot_password/fp_email_sent_screen.dart';
import 'package:superlabs/view/widgets/company_signature.dart';
import 'package:superlabs/view/widgets/custom_text_field.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    TextEditingController emailController = TextEditingController();
    TextEditingController firstNameController = TextEditingController();

    TextEditingController lastNameController = TextEditingController();

    TextEditingController mobileNumberController = TextEditingController();

    return Scaffold(
      backgroundColor: authScreenColor,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.05),
            child: ListView(
              children: [
                CommonFunction.blankSpace(context, 0.03, 0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: height * 0.1,
                      width: height * 0.1,
                      child: Image(
                        image: AssetImage(
                          'assets/images/Black_logo.png',
                        ),
                      ),
                    ),
                    CommonFunction.blankSpace(context, 0, 0.03),
                    Text(
                      'Create account',
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(color: black),
                    )
                  ],
                ),
                CommonFunction.blankSpace(context, 0.05, 0),
                Text(
                  'Email ID',
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                CommonFunction.blankSpace(context, 0.005, 0),
                CustomTextField(
                  hint: '',
                  controller: emailController,
                  requiredheight: height * 0.065,
                  requiredwidth: width,
                  borderColor: transparent,
                  borderWidth: 0,
                  obscureText: false,
                ),
                CommonFunction.blankSpace(context, 0.03, 0),
                Text(
                  'First name',
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                CommonFunction.blankSpace(context, 0.005, 0),
                CustomTextField(
                  hint: '',
                  controller: firstNameController,
                  requiredheight: height * 0.065,
                  requiredwidth: width,
                  borderColor: transparent,
                  borderWidth: 0,
                  obscureText: false,
                ),
                CommonFunction.blankSpace(context, 0.03, 0),
                Text(
                  'Last name',
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                CommonFunction.blankSpace(context, 0.005, 0),
                CustomTextField(
                  hint: '',
                  controller: lastNameController,
                  requiredheight: height * 0.065,
                  requiredwidth: width,
                  borderColor: transparent,
                  borderWidth: 0,
                  obscureText: false,
                ),
                CommonFunction.blankSpace(context, 0.03, 0),
                Text(
                  'Mobile number',
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                CommonFunction.blankSpace(context, 0.005, 0),
                CustomTextField(
                  hint: '',
                  controller: mobileNumberController,
                  requiredheight: height * 0.065,
                  requiredwidth: width,
                  borderColor: transparent,
                  borderWidth: 0,
                  obscureText: false,
                ),
                CommonFunction.blankSpace(context, 0.03, 0),
                CommonFunction.blankSpace(context, 0.03, 0),
                Row(
                  children: [
                    Container(
                      height: height * 0.025,
                      width: height * 0.025,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: white,
                          border: Border.all(color: greenShade, width: 1)),
                    ),
                    CommonFunction.blankSpace(context, 0, 0.03),
                    RichText(
                      maxLines: 2,
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: 'I agree',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(
                                      color: black,
                                      fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: ' to the Super Labs ',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(color: black)),
                          TextSpan(
                              text: 'Terms &\nConditions',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(color: black))
                        ],
                      ),
                    ),
                  ],
                ),
                CommonFunction.blankSpace(context, 0.05, 0),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: const EmailSentScreenFP(),
                      ),
                    );
                  },
                  child: Container(
                    height: height * 0.065,
                    width: width,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: greenShade,
                    ),
                    child: Text(
                      'Create account',
                      style: Theme.of(context)
                          .textTheme
                          .headline3!
                          .copyWith(color: white),
                    ),
                  ),
                ),
                // Spacer(),
                CommonFunction.blankSpace(context, 0.06, 0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [CompanySignature()],
                ),
                // CommonFunction.blankSpace(context, 0.01, 0)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
