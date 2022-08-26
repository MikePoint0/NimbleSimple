import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nimble_simple/core/utils/colors.dart';

import '../../../../core/utils/constants.dart';
import '../detailScreen.dart';
import 'custom_clipper.dart';

class CardMain extends StatelessWidget {
  final ImageProvider image;
  final String title;
  final String value;
  final String unit;
  final Color color;

  CardMain(
      {
      Key? key,
      required this.image,
      required this.title,
      required this.value,
      required this.unit,
      required this.color
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.topLeft,
        child: Container(
            margin: EdgeInsets.only(right: 15.0.w),
            width: (
                (MediaQuery.of(context).size.width - (AppConstants.paddingSide * 2 + AppConstants.paddingSide / 2)) /
                2),
            decoration: new BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              shape: BoxShape.rectangle,
              color: color,
            ),
            child: Material(
              child: InkWell(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                        child: ClipPath(
                            clipper: MyCustomClipper(clipType: ClipType.semiCircle),
                            child: Container(
                              decoration: new BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                color: Colors.black.withOpacity(0.03),
                              ),
                              height: 120,
                              width: 120,
                            ),
                        ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          // Icon and Hearbeat
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Image(
                                width: 32,
                                height: 32,
                                image: image
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text(
                                      title,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: AppColors.sonaBlack
                                      ),
                                  ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Text(value,
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w900,
                                  color: AppColors.sonaBlack,
                              ),
                          ),
                          Text(
                              unit,
                              style: TextStyle(
                                  fontSize: 15,
                                  color: AppColors.sonaBlack
                              ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                onTap: () {
                  debugPrint("CARD main clicked. redirect to details page");
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DetailScreen()),
                  );
                },
              ),
              color: Colors.transparent,
            ),
        ),
    );
  }
}
