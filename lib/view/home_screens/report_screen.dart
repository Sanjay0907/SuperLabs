import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:superlabs/constants/common_functions.dart';
import 'package:superlabs/controller/provider/user_provider.dart';
import 'package:superlabs/model/user_model.dart';
import 'package:superlabs/utils/colors.dart';
import 'package:superlabs/view/widgets/appbar.dart';
import 'package:superlabs/view/widgets/custom_text_field.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});
  @override
  Widget build(BuildContext context) {
    TextEditingController searchOrderController = TextEditingController();

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
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      UserModel currentReport = userProvider.userDatas[index];
                      return InkWell(
                        onTap: () {
                          if (currentReport.orderStatus == 'Not Ready') {
                            return CommonFunction.showReportUnderWayDialog(
                              context,
                              height,
                              width,
                            );
                          }
                          if (currentReport.orderStatus == 'Ready Now') {
                            return CommonFunction.showReportReadyDialog(
                              context,
                              height,
                              width,
                            );
                          }
                          if (currentReport.orderStatus == 'Email Sent') {
                            return CommonFunction.showReportSentDialog(
                              context,
                              height,
                              width,
                            );
                          }
                        },
                        child: Container(
                          height: height * 0.1,
                          width: width,
                          padding: EdgeInsets.all(height * 0.01),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: containerColor,
                          ),
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
                                  Builder(
                                    builder: (context) {
                                      if (currentReport.orderStatus ==
                                          'Not Ready') {
                                        return RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text:
                                                    'Order# ${currentReport.orderNo} / ',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline6!
                                                    .copyWith(
                                                        color: greyShade6E7777),
                                              ),
                                              TextSpan(
                                                text:
                                                    '${currentReport.orderStatus}',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline6!
                                                    .copyWith(
                                                      color: red,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        );
                                      } else {
                                        return Text(
                                          'Order# ${currentReport.orderNo} / ${currentReport.orderStatus}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6!
                                              .copyWith(color: greyShade6E7777),
                                        );
                                      }
                                    },
                                  ),
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
