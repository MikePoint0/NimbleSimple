
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nimble_simple/core/utils/images.dart';
import 'package:nimble_simple/core/utils/styles.dart';

import '../../core/utils/colors.dart';

class OnboardingWrapper extends StatelessWidget {
  String image, header, subHeader;

  OnboardingWrapper({Key? key, required this.image, required this.header, required this.subHeader}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Image.asset(
            image,
            fit: BoxFit.contain,
            repeat: ImageRepeat.noRepeat,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            height: MediaQuery.of(context).size.height * 0.6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                      header,
                      style: AppStyle.h2.copyWith(color: AppColors.sonaBlack2),
                    ),
                Text(
                      subHeader,
                      textAlign: TextAlign.center,
                      style: AppStyle.text2.copyWith(color: AppColors.sonaGrey4, fontWeight: FontWeight.w400),
                    )
              ],
            ),
          )
          // Align(
          //   alignment: Alignment.bottomLeft,
          //   child: Padding(
          //       padding: const EdgeInsets.symmetric(horizontal: 20),
          //       child: Text(
          //         header,
          //         textAlign: TextAlign.left,
          //         style: const TextStyle(fontSize: 36, color: Colors.white, fontWeight: FontWeight.w700, height: 1.1),
          //       )),
          // )
        ],
      ),
    );
  }
}
