import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:superlabs/constants/common_functions.dart';
import 'package:superlabs/controller/provider/currentUserProvider.dart';
import 'package:superlabs/controller/provider/index_provider.dart';
import 'package:superlabs/model/user_model.dart';
import 'package:superlabs/utils/colors.dart';
import 'package:superlabs/view/home_screens/sample_screen_user.dart';
import 'package:superlabs/view/widgets/custom_text_field.dart';

import '../../controller/provider/user_provider.dart';
import '../widgets/appbar.dart';

class SampleScreen extends StatefulWidget {
  const SampleScreen({super.key});

  @override
  State<SampleScreen> createState() => _SampleScreenState();
  popScreen(BuildContext context) {
    Navigator.pop(context);
  }

  navigateToUserSampleScreen(BuildContext context) {
    // AppBuilder.of(context).rebuild();
    return Navigator.push(
        context,
        PageTransition(
          type: PageTransitionType.rightToLeft,
          child: SampleScreenCurrentUser(
            currentUser:
                Provider.of<CurrentUserProvider>(context, listen: false)
                    .currentModel,
            navigatedFromOrders: true,
          ),
        ));
  }
}

class _SampleScreenState extends State<SampleScreen> {
  @override
  void initState() {
    super.initState();
    log('In Sample Screen');
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController searchOrderController = TextEditingController();
    log('in sample screen');
    if ((Provider.of<IndexProvider>(context, listen: false).currentindex ==
            1) &&
        (Provider.of<IndexProvider>(context, listen: false).triggerNavigation ==
            true)) {
      Future.delayed(Duration.zero, () async {
        Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.rightToLeft,
              child: SampleScreenCurrentUser(
                currentUser:
                    Provider.of<CurrentUserProvider>(context, listen: false)
                        .currentModel,
                navigatedFromOrders: false,
              ),
            ));
      });
    }
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: SuperLabsAppbar.appbar(context, height, width),
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonFunction.blankSpace(context, 0.02, 0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextField(
                    hint: 'Search orders by number',
                    controller: searchOrderController,
                    requiredheight: height * 0.045,
                    requiredwidth: width * 0.7,
                    borderColor: greyShade,
                    borderWidth: 1,
                    suffixIcon: Icon(
                      Icons.search,
                      color: greenShade,
                    ),
                    obscureText: false,
                  ),
                  Container(
                    height: height * 0.045,
                    width: width * 0.18,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: greenShade,
                    ),
                    child: Text(
                      'Go',
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(color: white),
                    ),
                  ),
                ],
              ),
              CommonFunction.blankSpace(context, 0.03, 0),
              Text(
                'Orders',
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Consumer<UserProvider>(
                builder: (context, userProvider, child) {
                  return ListView.builder(
                    itemCount: 3,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      UserModel currentReport = userProvider.userDatas[index];
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.rightToLeft,
                                child: SampleScreenCurrentUser(
                                  currentUser: currentReport,
                                  navigatedFromOrders: false,
                                ),
                              ));
                        },
                        child: Container(
                          height: height * 0.1,
                          width: width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: containerColor,
                          ),
                          padding: EdgeInsets.all(height * 0.01),
                          margin: EdgeInsets.symmetric(vertical: height * 0.01),
                          child: Row(
                            children: [
                              Container(
                                height: height * 0.075,
                                width: height * 0.075,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: greyShade2,
                                ),
                                child: SvgPicture.asset(
                                  'assets/images/report.svg',
                                  width: width * 0.07,
                                ),
                              ),
                              SizedBox(
                                width: width * 0.03,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    currentReport.name!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5!
                                        .copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '${currentReport.sex}/${currentReport.age}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6!
                                        .copyWith(color: greyShade6E7777),
                                  ),
                                  Text(
                                    'Order# ${currentReport.orderNo} / ${currentReport.sampleStatus}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6!
                                        .copyWith(color: greyShade6E7777),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
