import 'package:barcode/barcode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:superlabs/constants/common_functions.dart';
import 'package:superlabs/controller/provider/index_provider.dart';
import 'package:superlabs/model/user_model.dart';
import 'package:superlabs/utils/colors.dart';
import '../../constants/constants.dart';
import '../widgets/appbar.dart';
import '../widgets/custom_back_pop_botton.dart';

class SampleScreenCurrentUser extends StatefulWidget {
  const SampleScreenCurrentUser(
      {super.key,
      required this.currentUser,
      required this.navigatedFromOrders});
  final UserModel currentUser;
  final bool navigatedFromOrders;

  @override
  State<SampleScreenCurrentUser> createState() =>
      _SampleScreenCurrentUserState();
}

class _SampleScreenCurrentUserState extends State<SampleScreenCurrentUser> {
  bool collectSampleBtnPressed = false;
  bool barcoodPrinted = false;

  MeCard barcodeData = MeCard.contact(
    name: '',
  );
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: SizedBox(
      //     width: 300,
      //     child: Row(
      //       children: [
      //         SizedBox(
      //           width: width * 0.1,
      //           child: const Image(
      //             image: AssetImage(
      //               'assets/images/lab_logo.png',
      //             ),
      //           ),
      //         ),
      //         Text(
      //           'My Super Labs Pathology Center',
      //           style: Theme.of(context)
      //               .textTheme
      //               .headline5!
      //               .copyWith(fontWeight: FontWeight.bold),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      appBar: SuperLabsAppbar.appbar(context, height, width),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(
              left: width * 0.05, right: width * 0.05, top: height * 0.02),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              CustomBackPopButton(width: width),
              CommonFunction.blankSpace(context, 0.03, 0),
              Text(
                'Order details',
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              CommonFunction.blankSpace(context, 0.01, 0),
              Row(
                children: [
                  CommonFunction.blankSpace(context, 0, 0.1),
                  SizedBox(
                    width: width * 0.50,
                    child: Text(
                      widget.currentUser.name!,
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    width: width * 0.20,
                    child: Text(
                      '${widget.currentUser.sex!} / ${widget.currentUser.age!}',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  )
                ],
              ),
              CommonFunction.blankSpace(context, 0.03, 0),
              Text(
                'Collect Samples For',
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              ListView.builder(
                  itemCount: 5,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      height: height * 0.065,
                      width: width,
                      padding: EdgeInsets.symmetric(
                          vertical: height * 0.0025, horizontal: width * 0.01),
                      margin: EdgeInsets.symmetric(vertical: height * 0.005),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: containerColor),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(height * 0.015),
                            height: height * 0.06,
                            width: height * 0.06,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                                color: greyShade2),
                            child: SvgPicture.asset(
                              'assets/images/testtube.svg',
                            ),
                          ),
                          CommonFunction.blankSpace(context, 0, 0.02),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                tests[index][0],
                                style: Theme.of(context).textTheme.headline5,
                              )
                            ],
                          ),
                          Spacer(),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Sample not collected',
                                style: Theme.of(context).textTheme.headline6,
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  }),
              CommonFunction.blankSpace(context, 0.03, 0),
              Text(
                'Sample Collected',
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              CommonFunction.blankSpace(context, 0.02, 0),
              barcoodPrinted == true
                  ? AnimatedContainer(
                      duration: const Duration(seconds: 10),
                      margin: EdgeInsets.symmetric(horizontal: width * 0.05),
                      height: height * 0.15,
                      width: width,
                      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: greyShade2,
                      ),
                      child: Image(
                        image: AssetImage(
                          'assets/images/barcode.png',
                        ),
                        fit: BoxFit.fitWidth,
                      ),
                    )
                  : SizedBox(),
              barcoodPrinted == true
                  ? CommonFunction.blankSpace(context, 0.02, 0)
                  : SizedBox(),
              InkWell(
                onTap: () {
                  setState(() {
                    barcoodPrinted = true;
                  });
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: width * 0.05),
                  height: height * 0.15,
                  width: width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: greyShade2,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/images/generateBarcode.svg',
                        width: width * 0.11,
                        color: black,
                      ),
                      CommonFunction.blankSpace(context, 0.01, 0),
                      Text(
                        'Generate now',
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(color: textColorDarkLiver),
                      ),
                    ],
                  ),
                ),
              ),
              barcoodPrinted == true
                  ? CommonFunction.blankSpace(context, 0.02, 0)
                  : SizedBox(),
              barcoodPrinted == true
                  ? InkWell(
                      onTap: () {},
                      child: Container(
                        height: height * 0.07,
                        width: width,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: greenShade,
                        ),
                        child: Text(
                          'Done',
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(color: white),
                        ),
                      ),
                    )
                  : SizedBox(),
              CommonFunction.blankSpace(context, 0.02, 0),
            ],
          ),
        ),
      ),
    );
  }
}
