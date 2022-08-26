import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:nimble_simple/core/utils/colors.dart';
import 'package:nimble_simple/screens/main/innerPages/widgets/card_items.dart';
import 'package:nimble_simple/screens/main/innerPages/widgets/card_main.dart';
import 'package:nimble_simple/screens/main/innerPages/widgets/card_section.dart';
import 'package:nimble_simple/screens/main/innerPages/widgets/custom_clipper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/datasource/local_storage.dart';
import '../../../core/navigation/keys.dart';
import '../../../core/navigation/navigation_service.dart';
import '../../../core/startup/app_startup.dart';
import '../../../core/utils/constants.dart';
import '../../../core/utils/response_message.dart';
import '../../../core/widgets/button.dart';
import '../cubit/main_cubit.dart';
import '../model/PharmacyList.dart';
import '../model/PurchaseList.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  PharmacyList? _pharmacyList;

  @override
  void initState() {
    _getData(context);
    super.initState();
  }

  Future<void> _getData(BuildContext context) async {
    await serviceLocator<MainCubit>().getPharmacyList(context);
  }

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: AppColors.sonaWhite,
      body: BlocListener(
          bloc: serviceLocator.get<MainCubit>(),
          listener: (_, state) {
            if (state is PharmacyListLoading) {
              context.loaderOverlay.show();
            }

            if (state is PharmacyListError) {
              context.loaderOverlay.hide();
              ResponseMessage.showErrorSnack(
                  context: context, message: state.message);
            }

            if (state is PharmacyListSuccess) {
              context.loaderOverlay.hide();
              _pharmacyList = GetIt.I.get<PharmacyList>();
              print("::::" + _pharmacyList!.pharmacies![0].name.toString());
              setState(() {});
            }
          },
          child: _pharmacyList == null
              ? Container()
              : Stack(
                  children: <Widget>[
                    ClipPath(
                      clipper: MyCustomClipper(clipType: ClipType.bottom),
                      child: Container(
                        color: Theme.of(context).accentColor,
                        height: AppConstants.headerHeight + statusBarHeight,
                      ),
                    ),
                    Positioned(
                      right: -45,
                      top: -30,
                      child: ClipOval(
                        child: Container(
                          color: Colors.black.withOpacity(0.05),
                          height: 220,
                          width: 220,
                        ),
                      ),
                    ),

                    // BODY
                    Padding(
                      padding: EdgeInsets.all(AppConstants.paddingSide),
                      child: ListView(
                        children: <Widget>[
                          // Header - Greetings and Avatar
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  "Good Morning,\nPatient",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white),
                                ),
                              ),
                              CircleAvatar(
                                  radius: 26.0,
                                  backgroundImage: AssetImage(
                                      'assets/icons/profile_picture.png'))
                            ],
                          ),

                          SizedBox(height: 50),

                          // Main Cards - Heartbeat and Blood Pressure
                          Container(
                            height: 140,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: <Widget>[
                                CardMain(
                                  image:
                                      AssetImage('assets/icons/heartbeat.png'),
                                  title: "Hearbeat",
                                  value: "66",
                                  unit: "bpm",
                                  color: AppColors.sonaGreen,
                                ),
                                CardMain(
                                    image: AssetImage(
                                        'assets/icons/blooddrop.png'),
                                    title: "Blood Pressure",
                                    value: "66/123",
                                    unit: "mmHg",
                                    color: AppColors.sonaYellow)
                              ],
                            ),
                          ),

                          // Section Cards - Daily Medication
                          SizedBox(height: 30),

                          SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: AppButton(
                                  buttonText: "Start Ordering (Closest)".tr(),
                                  onPressed: () {

                                  })),

                          SizedBox(height: 30),

                          Text(
                            "Already Purchased",
                            style: TextStyle(
                              color: AppColors.sonaBlack3,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          SizedBox(height: 20.h),

                          Container(
                              height: 125.h,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: <Widget>[
                                  CardSection(
                                    image:
                                        AssetImage('assets/icons/capsule.png'),
                                    title: "Metforminv",
                                    value: "2",
                                    unit: "pills",
                                    time: "6-7AM",
                                    isDone: false,
                                  ),
                                  CardSection(
                                    image:
                                        AssetImage('assets/icons/syringe.png'),
                                    title: "Trulicity",
                                    value: "1",
                                    unit: "shot",
                                    time: "8-9AM",
                                    isDone: true,
                                  )
                                ],
                              )),

                          SizedBox(height: 0.h),

                          // Scheduled Activities
                          Text(
                            "Available Pharmacies",
                            style: TextStyle(
                                color: AppColors.sonaBlack3,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold),
                          ),


                          SizedBox(height: 20),

                          Container(
                            child: ListView.builder(
                                itemCount: _pharmacyList!.pharmacies!.length,
                                scrollDirection: Axis.vertical,
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (BuildContext context, int position) {
                                  //check if i already bought
                                  bool alreadyTransacted = false;
                                  String drugs = "";

                                  return FutureBuilder<PurchaseList?> (
                                      future: GetIt.I.get<LocalStorage>().readSecureObject(_pharmacyList!.pharmacies![position].pharmacyId!),
                                      builder: (context, snap) {
                                        if(snap.hasData) {
                                          print(snap.data!.pharmacyId!+" "+_pharmacyList!.pharmacies![position].pharmacyId!);
                                          if (snap.data!.pharmacyId == _pharmacyList!.pharmacies![position].pharmacyId) {
                                            alreadyTransacted = true;
                                            // for(dynamic item in snap.data!.drugs!) {
                                            //   drugs = item;
                                            // }
                                          }
                                        }
                                        return InkWell(
                                          onTap: () {
                                            !alreadyTransacted
                                            ? serviceLocator
                                                .get<NavigationService>()
                                                .toWithPameter(
                                                routeName:
                                                RouteKeys.routeDetailScreen,
                                                data: {
                                                  "data": _pharmacyList!
                                                      .pharmacies![position]
                                                })
                                                : ResponseMessage.showSuccessSnack(
                                                context: context, message: "Product bought are:\n"+drugs);
                                          },
                                          child: CardItems(
                                            image: Image.asset(
                                              'assets/icons/pharma.jpg',
                                              height: 60.h,
                                              width: 60.w,
                                            ),
                                            title: _pharmacyList!.pharmacies![position].name!,
                                            alreadyTransacted: alreadyTransacted
                                          ),
                                        );
                                      }
                                  );
                                }),
                          ),
                        ],
                      ),
                    )
                  ],
                )),
    );
  }
}
