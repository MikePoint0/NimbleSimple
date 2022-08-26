import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';
import 'package:nimble_simple/core/navigation/navigation_service.dart';
import 'package:nimble_simple/core/utils/colors.dart';
import 'package:nimble_simple/core/utils/constants.dart';
import 'package:nimble_simple/core/utils/images.dart';

import '../utils/styles.dart';
import 'button.dart';

class PopUpPageScreen extends StatefulWidget {

  final Map? data;

  const PopUpPageScreen({Key? key, this.data}) : super(key: key);

  @override
  _PopUpPageScreenState createState() => _PopUpPageScreenState();
}

class _PopUpPageScreenState extends State<PopUpPageScreen> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.sonaWhite,
      child: AlertDialog(
        backgroundColor: AppColors.sonaWhite,
        content: Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(AppConstants.normalRadius))),
          width: MediaQuery.of(context).size.width,
          height: 320,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Lottie.asset(
                  AppAssets.lottieSuccess,
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
                Text(
                  widget.data!["title"],
                  textAlign: TextAlign.center,
                  style: AppStyle.text3.copyWith(color: AppColors.sonaBlack2, fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 10),
                Text(
                  widget.data!["subTitle"],
                  textAlign: TextAlign.center,
                  style: AppStyle.text2.copyWith(color: AppColors.sonaBlack2, fontWeight: FontWeight.w400, fontSize: 12.sp),
                ),
                Container(
                    margin: const EdgeInsets.only(top: 20),
                    width: MediaQuery.of(context).size.width,
                    child: AppButton(
                        buttonText: widget.data!["buttonText"]! ?? "continue".tr(),
                        onPressed: () {
                          _nextPage(context);
                        })
                )
              ]),
        ),
      ),
    );
  }

  Future<void> _nextPage(BuildContext context) async {
    if (widget.data!["routeType"] == "ClearAll") {
      GetIt.I.get<NavigationService>().clearAllTo(widget.data!["route"]);
    }
    if (widget.data!["routeType"] == "pop") {
      Navigator.of(context).pop(true);
    }

  }
}
