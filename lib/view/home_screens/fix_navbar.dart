import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:superlabs/constants/constants.dart';
import 'package:superlabs/utils/colors.dart';
import 'package:superlabs/view/home_screens/default_screen.dart';
import 'package:superlabs/view/home_screens/order_screens.dart';
import 'package:superlabs/view/home_screens/profile_screen.dart';
import 'package:superlabs/view/home_screens/report_screen.dart';
import 'package:superlabs/view/home_screens/sample_screen.dart';

class HomeScreenNavBar extends StatefulWidget {
  const HomeScreenNavBar({super.key});

  @override
  State<HomeScreenNavBar> createState() => _HomeScreenNavBarState();
}

class _HomeScreenNavBarState extends State<HomeScreenNavBar> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return CupertinoTabScaffold(
        backgroundColor: greenShade,
        tabBar: CupertinoTabBar(
            onTap: (value) {
              log(value.toString());
              setState(() {
                currentIndex = value;
              });
              // PageController.ani
            },
            backgroundColor: greenShade,
            activeColor: white,
            height: height * 0.08,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/images/orders.svg',
                  color: currentIndex == 0 ? white : black,
                ),
                label: 'Orders',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/images/sample.svg',
                  color: currentIndex == 1 ? white : black,
                ),
                label: 'Sample',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/images/report_.svg',
                  color: currentIndex == 2 ? white : black,
                ),
                label: 'Report',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/images/profile.svg',
                  color: currentIndex == 3 ? white : black,
                ),
                label: 'Profile',
              ),
            ]),
        tabBuilder: (context, index) {
          switch (currentIndex) {
            case 0:
              return CupertinoTabView(
                builder: (context) =>
                    CupertinoPageScaffold(child: OrderScreen()),
              );
            case 1:
              return CupertinoTabView(
                builder: (context) =>
                    CupertinoPageScaffold(child: SampleScreen()),
              );
            case 2:
              return CupertinoTabView(
                builder: (context) =>
                    CupertinoPageScaffold(child: ReportScreen()),
              );
            case 3:
              return CupertinoTabView(
                builder: (context) =>
                    CupertinoPageScaffold(child: ProfileScreen()),
              );
            default:
              return CupertinoTabView(
                builder: (context) =>
                    CupertinoPageScaffold(child: ErrorScreen()),
              );
          }
        });
  }
}
