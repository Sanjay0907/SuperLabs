import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:superlabs/controller/bottom_tab_controller.dart';
import 'package:superlabs/controller/provider/index_provider.dart';
import 'package:superlabs/model/user_model.dart';
import 'package:superlabs/view/widgets/appbar.dart';
import 'package:superlabs/view/widgets/custom_back_pop_botton.dart';
import '../../constants/common_functions.dart';
import '../../constants/constants.dart';
import '../../controller/provider/currentUserProvider.dart';
import '../../utils/colors.dart';

class UsersOrderScreen extends StatefulWidget {
  const UsersOrderScreen({super.key, required this.userDetails});
  final UserModel userDetails;

  @override
  State<UsersOrderScreen> createState() => _UsersOrderScreenState();
}

class _UsersOrderScreenState extends State<UsersOrderScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: SuperLabsAppbar.appbar(context, height, width),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(
              left: width * 0.05, right: width * 0.05, top: height * 0.02),
          child: ListView(physics: BouncingScrollPhysics(), children: [
            // BackButton(),
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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: width * 0.40,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.userDetails.name!,
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${widget.userDetails.sex} / ${widget.userDetails.age}',
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(color: greyShade6E7777),
                      ),
                      Text(
                        'Mobile ${widget.userDetails.mobileNo}',
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(color: greyShade6E7777),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                    width: width * 0.40,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Order#',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(color: greyShade6E7777),
                            ),
                            Text(
                              '${widget.userDetails.orderNo}',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(color: greyShade6E7777),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Advance Rs.',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(color: greyShade6E7777),
                            ),
                            Text(
                              '${oCcy.format(widget.userDetails.advance)}',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(color: greyShade6E7777),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Due Amt Rs.',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(color: greyShade6E7777),
                            ),
                            Text(
                              '${oCcy.format(widget.userDetails.due)}',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(color: greyShade6E7777),
                            ),
                          ],
                        ),
                      ],
                    ))
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
            CommonFunction.blankSpace(context, 0.02, 0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () async {
                    context
                        .read<CurrentUserProvider>()
                        .updateUserModel(widget.userDetails);
                    context.read<IndexProvider>().updateTrigerNavigation(true);
                    context.read<IndexProvider>().updateCurrentIndex(1);
                    await controller.jumpToTab(1);
                  },
                  child: Container(
                    height: height * 0.08,
                    width: height * 0.08,
                    padding: EdgeInsets.all(0.005),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: greenShade,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/images/tt.svg'),
                        Text(
                          'Collect\nSamples',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 10,
                            color: white,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}

class BackButton extends StatelessWidget {
  const BackButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(
          context,
        );
      },
      child: SizedBox(
        // width: width * 0.30,
        child: Row(
          children: [
            FaIcon(
              FontAwesomeIcons.angleLeft,
              size: 20,
              color: black,
            ),
            CommonFunction.blankSpace(context, 0, 0.01),
            Text(
              'Back',
              style: Theme.of(context).textTheme.headline5!,
            ),
          ],
        ),
      ),
    );
  }
}
