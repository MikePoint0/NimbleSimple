import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/colors.dart';
import 'custom_clipper.dart';

class CardItems extends StatelessWidget {
  final Image image;
  final String title;
  final bool alreadyTransacted;

  CardItems({
    Key? key,
    required this.image,
    required this.title,
    this.alreadyTransacted =false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 0),
        height: 100,
        decoration: new BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          shape: BoxShape.rectangle,
          color: Colors.white,
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
                child: ClipPath(
                    clipper: MyCustomClipper(clipType: ClipType.halfCircle),
                    child: Container(
                      decoration: new BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        color: AppColors.sonaPurple1.withOpacity(0.1),
                      ),
                      height: 100,
                      width: 100,
                    ),
                ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                alreadyTransacted
                    ? Icon(
                  Icons.check_circle,
                  size: 24.sp,
                  color: AppColors.sonaRed,
                ) : SizedBox.shrink(),
                image,
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('$title',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: AppColors.sonaBlack3
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
    );
  }
}
