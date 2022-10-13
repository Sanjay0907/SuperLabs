import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:superlabs/controller/bottom_tab_controller.dart';
import 'package:superlabs/controller/provider/index_provider.dart';
import 'package:superlabs/utils/colors.dart';
import 'package:superlabs/view/home_screens/order_screens.dart';
import 'package:superlabs/view/home_screens/profile_screen.dart';
import 'package:superlabs/view/home_screens/report_screen.dart';
import 'package:superlabs/view/home_screens/sample_screen.dart';

class PersistentBottomNavBar extends StatelessWidget {
  const PersistentBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> _buildScreens() {
      return [OrderScreen(), SampleScreen(), ReportScreen(), ProfileScreen()];
    }

    List<PersistentBottomNavBarItem> _navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          icon: SvgPicture.asset(
            'assets/images/orders.svg',
            width: 25,
            color: context.watch<IndexProvider>().currentindex == 0
                ? white
                : black,
          ),
          title: ("Orders"),
          activeColorPrimary: white,
          inactiveColorPrimary: black,
        ),
        PersistentBottomNavBarItem(
          icon: SvgPicture.asset(
            'assets/images/sample.svg',
            width: 25,
            color: context.watch<IndexProvider>().currentindex == 1
                ? white
                : black,
          ),
          title: ("Sample"),
          activeColorPrimary: white,
          inactiveColorPrimary: black,
        ),
        PersistentBottomNavBarItem(
          icon: Column(
            children: [
              SvgPicture.asset(
                'assets/images/report_.svg',
                width: 25,
                color: context.watch<IndexProvider>().currentindex == 2
                    ? white
                    : black,
              ),
            ],
          ),
          title: ("Report"),
          activeColorPrimary: white,
          inactiveColorPrimary: black,
        ),
        PersistentBottomNavBarItem(
          icon: SvgPicture.asset(
            'assets/images/profile.svg',
            color: context.watch<IndexProvider>().currentindex == 3
                ? white
                : black,
          ),
          title: ("Profile"),
          activeColorPrimary: white,
          inactiveColorPrimary: black,
        ),
      ];
    }

    return PersistentTabView(
      context,
      controller: controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      onItemSelected: (value) {
        log(value.toString());
        context.read<IndexProvider>().updateCurrentIndex(value);
      },
      backgroundColor: greenShade, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50), topRight: Radius.circular(50)),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.once,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 400),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style6, // Choose the nav bar style with this property.
    );
  }
}
