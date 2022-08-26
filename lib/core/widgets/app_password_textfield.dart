import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/colors.dart';
import 'app_textfield.dart';

class AppPasswordTextField extends StatefulWidget {
  final String? initialValue;
  final String? headerText;
  final String? descriptionText;
  final String? hintText;
  final bool readOnly;
  final bool enabled;
  final AppTextFieldSize textFieldSize;
  final TextInputAction textInputAction;
  final DescriptionPosition descriptionPosition;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmit;
  final TextEditingController? controller;

  const AppPasswordTextField({
    Key? key,
    this.headerText,
    this.hintText,
    this.readOnly = false,
    this.enabled = true,
    this.textInputAction = TextInputAction.next,
    this.onChanged,
    this.onSubmit,
    this.controller,
    this.validator,
    this.descriptionText,
    this.descriptionPosition = DescriptionPosition.bottom,
    this.onSaved,
    this.initialValue,
    this.textFieldSize = AppTextFieldSize.normal,
  }) : super(key: key);

  @override
  State<AppPasswordTextField> createState() => _AppPasswordTextFieldState();
}

class _AppPasswordTextFieldState extends State<AppPasswordTextField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return AppTextField(
      headerText: widget.headerText,
      descriptionText: widget.descriptionText,
      initialValue: widget.initialValue,
      controller: widget.controller,
      textInputAction: widget.textInputAction,
      enabled: widget.enabled,
      readOnly: widget.readOnly,
      obscureText: obscureText,
      onChanged: widget.onChanged,
      validator: widget.validator,
      onSaved: widget.onSaved,
      suffixWidget: Padding(
        padding: EdgeInsets.only(right: 18.w, top: 0.h),
        child: GestureDetector(
          onTap: () {
            setState(() {
              obscureText = !obscureText;
            });
          },
          child: Icon(
            obscureText
                ? Iconsax.eye_slash
                : Iconsax.eye,
            size: 20.sp,
            color: AppColors.sonaGrey3,
          ),
        ),
      ),

      // suffixWidget: IconButton(
      //   onPressed: () {
      //     obscureText = !obscureText;
      //     setState(() {});
      //   },
      //   icon: Icon(
      //     obscureText ? Icons.visibility : Icons.visibility_off,
      //   ),
      // ),
    );
  }
}
