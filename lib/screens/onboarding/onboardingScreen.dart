import 'dart:io';

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:nimble_simple/core/enums/button.dart';
import 'package:nimble_simple/core/navigation/keys.dart';
import 'package:nimble_simple/core/navigation/navigation_service.dart';
import 'package:nimble_simple/core/utils/colors.dart';
import 'package:nimble_simple/core/widgets/button.dart';

import 'models/onboarding_model.dart';
import 'onboardingWrapper.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  List<OnboardingModel> slides = <OnboardingModel>[];
  var currentIndex = 0;
  PageController pageController = PageController(initialPage: 0);

  nav() {
    SchedulerBinding.instance?.addPostFrameCallback((timeStamp) {
      // Navigator.pushReplacement(
      //     context, MaterialPageRoute(builder: (context) => AuthHome()));
    });
  }

  @override
  void initState() {
    super.initState();
    slides = getSlides();
  }

  Widget pageIndicator(bool isCurrentPage) {
    return Container(
      margin:  EdgeInsets.symmetric(horizontal: 4.0.w),
      height: 10.0,
      width: 10.0,
      decoration: BoxDecoration(
          color: isCurrentPage ? AppColors.sonaBlack2 : AppColors.sonaBlack2.withOpacity(0.3),
          borderRadius: BorderRadius.circular(10.0)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(height: 40.h),
              Flexible(
                child: PageView.builder(
                  controller: pageController,
                  itemCount: slides.length,
                  onPageChanged: (val) {
                    setState(() {
                      currentIndex = val;
                    });
                  },
                  itemBuilder: (context, index) {
                    return OnboardingWrapper(
                      image: slides[index].getImage(),
                      header: slides[index].getHeader(),
                      subHeader: slides[index].getSubHeader(),
                    );
                  },
                ),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.7,
                ),
                child: Column(
                  children: [
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          for (var i = 0; i < slides.length; i++)
                            currentIndex == i
                                ? pageIndicator(true)
                                : pageIndicator(false)
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 40.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: AppButton(
                    buttonText: 'login'.tr(),
                    buttonType: ButtonType.primary,
                    onPressed: () => GetIt.I.get<NavigationService>().to(RouteKeys.routeLoginScreen),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: <Widget>[
              //     Text(
              //       "already_have_an_account".tr(),
              //       style: TextStyle(
              //           fontSize: 14.sp,
              //           decoration: TextDecoration.none,
              //           color: Colors.grey[600]),
              //     ),
              //     InkWell(
              //       onTap: () => {
              //       GetIt.I.get<NavigationService>().to(RouteKeys.routeLoginScreen)
              //       },
              //       child: Text("login".tr(),
              //           style: TextStyle(
              //               fontSize: 14.sp,
              //               fontWeight: FontWeight.bold,
              //               decoration: TextDecoration.none,
              //               color: Colors.white)),
              //     ),
              //   ],
              // )
            ],
          ),
         ],
      ),
    );
  }

}
