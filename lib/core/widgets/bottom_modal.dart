import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../navigation/navigation_service.dart';
import '../startup/app_startup.dart';
import '../utils/colors.dart';

showBottomModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    elevation: 0,
    backgroundColor: Colors.transparent,
    builder: (_) => Container(
      width: 375.w,
      height: 303.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(29.r),
          topRight: Radius.circular(29.r),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            offset: const Offset(0, 4),
            blurRadius: 30,
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: 45.w,
            height: 6.h,
            margin: EdgeInsets.symmetric(vertical: 10.h),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(.1),
              borderRadius: BorderRadius.circular(100.r),
            ),
          ),
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Text(
                'Logging out?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.sonaLightBlack,
                  fontSize: 18.sp,
                  height: 1.2,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  onPressed: () => serviceLocator<NavigationService>().pop(),
                  icon: const Icon(Icons.close, color: Color(0xFF50555C)),
                ),
              ),
            ],
          ),
          Divider(height: 14.h, thickness: 1.2, color: const Color(0xFFF2F2F2)),
          SizedBox(height: 21.h),
          Text(
            'Are you sure you want\nlogout?',
            textAlign: TextAlign.center,
            style: TextStyle(
              height: 1.41,
              fontSize: 18.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.sonaLightBlack,
            ),
          ),
          SizedBox(height: 51.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _modalButton(
                buttonText: 'Cancel',
                buttonType: ModalButtonType.outlined,
                onPressed: () => serviceLocator<NavigationService>().pop(),
              ),
              SizedBox(width: 13.w),
              _modalButton(
                buttonText: 'Confirm',
                buttonType: ModalButtonType.solid,
                onPressed: null,
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget _modalButton({
  required String buttonText,
  required ModalButtonType buttonType,
  required VoidCallback? onPressed,
}) =>
    ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shadowColor: Colors.transparent,
        primary: buttonType.color,
        fixedSize: Size(161.w, 50.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.r),
          side: BorderSide(color: buttonType.borderColor),
        ),
      ),
      child: Text(
        buttonText,
        style: TextStyle(
          height: 1,
          fontSize: 18.sp,
          fontWeight: FontWeight.w800,
          color: AppColors.sonaPurple2,
        ),
      ),
    );

enum ModalButtonType { solid, outlined }

extension on ModalButtonType {
  Color get borderColor {
    switch (this) {
      case ModalButtonType.outlined:
        return AppColors.sonaBlack3;
      case ModalButtonType.solid:
        return AppColors.sonaBlack;
    }
  }

  Color get color {
    switch (this) {
      case ModalButtonType.outlined:
        return Colors.transparent;
      case ModalButtonType.solid:
        return AppColors.sonaBlack;
    }
  }
}
