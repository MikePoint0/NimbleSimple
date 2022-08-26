import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import '../../../core/utils/helpers.dart';
import '../../core/utils/colors.dart';
import '../../core/utils/styles.dart';
import 'innerPages/dashboard.dart';

class BottomNavi extends StatefulWidget {
  final BuildContext? menuScreenContext;

  const BottomNavi({Key? key, this.menuScreenContext}) : super(key: key);

  @override
  _BottomNaviState createState() => _BottomNaviState();
}

class _BottomNaviState extends State<BottomNavi> {

  PersistentTabController? _controller;
  bool? _hideNavBar;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
    _hideNavBar = false;
  }

  List<Widget> _buildScreens() {
    return [
      DashBoard(),
      Center(
        child: Text("Just Text", style: AppStyle.text2),
      ),
      Center(
        child: Text("Just Text", style: AppStyle.text2),
      )
      //MessagesScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      persistentBottomNavBarItem("Dashboard", Iconsax.element_45),
      persistentBottomNavBarItem("Pharmacies", Iconsax.briefcase),
      persistentBottomNavBarItem("Profile", Iconsax.video),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: AppColors.sonaGrey6,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        navBarHeight: MediaQuery.of(context).viewInsets.bottom > 0
            ? 0.0
            : kBottomNavigationBarHeight,
        hideNavigationBarWhenKeyboardShows: true,
        margin: const EdgeInsets.symmetric(vertical: 0),
        padding: const NavBarPadding.symmetric(vertical: 8),
        popActionScreens: PopActionScreensType.all,
        bottomScreenMargin: 0.0,
        onWillPop: (context) async {
          await onBackPressed(context!, "Exit App", "You sure you want to exit!\nSure to Proceed?");
          return false;
        },
        selectedTabScreenContext: (context) {
          //testContext = context;
        },
        hideNavigationBar: _hideNavBar,
        decoration: NavBarDecoration(colorBehindNavBar: AppColors.sonaBlack4, borderRadius: BorderRadius.circular(0.0)),
        popAllScreensOnTapOfSelectedTab: true,
        itemAnimationProperties: const ItemAnimationProperties(
          duration: Duration(milliseconds: 400),
          curve: Curves.bounceOut,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style1, // Choose the nav bar style with this property
      ),
    );
  }
}