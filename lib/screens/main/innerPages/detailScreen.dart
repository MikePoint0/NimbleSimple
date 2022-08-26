import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:nimble_simple/screens/main/innerPages/widgets/custom_clipper.dart';

import '../../../core/navigation/navigation_service.dart';
import '../../../core/startup/app_startup.dart';
import '../../../core/utils/colors.dart';
import '../../../core/utils/constants.dart';
import '../../../core/utils/images.dart';
import '../../../core/utils/response_message.dart';
import '../../../core/widgets/button.dart';
import '../cubit/main_cubit.dart';
import '../model/PharmacyDetails.dart';
import 'orderScreen.dart';

class DetailScreen extends StatefulWidget {
  Map? data;
  DetailScreen({Key? key, this.data}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

  PharmacyDetails? _pharmacyDetails;

  @override
  void initState() {
    _getData();
    super.initState();
  }

  Future<void> _getData() async {
    await serviceLocator<MainCubit>().getPharmacyDetails(widget.data!["data"].pharmacyId);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;

    // For Grid Layout
    double _crossAxisSpacing = 8, _mainAxisSpacing = 8, _cellHeight = 150.0;
    int _crossAxisCount = 2;

    double _width = (MediaQuery.of(context).size.width -
            ((_crossAxisCount - 1) * _crossAxisSpacing)) /
        _crossAxisCount;
    double _aspectRatio =
        _width / (_cellHeight + _mainAxisSpacing + (_crossAxisCount + 1));

    return Scaffold(
        backgroundColor: AppColors.sonaWhite,
        body: BlocListener(
          bloc: serviceLocator.get<MainCubit>(),
          listener: (_, state) {
            if (state is PharmacyDetailsLoading) {
              context.loaderOverlay.show();
            }

            if (state is PharmacyDetailsError) {
              context.loaderOverlay.hide();
              ResponseMessage.showErrorSnack(
                  context: context, message: state.message);
            }

            if (state is PharmacyDetailsSuccess) {
              context.loaderOverlay.hide();
              _pharmacyDetails = GetIt.I.get<PharmacyDetails>();
              //print("::::" + _pharmacyList!.pharmacies![0].name.toString());
              setState(() {});
            }
          },
          child: _pharmacyDetails == null
              ? Center(
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  height: 80.0,
                  width: 80.0,
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
                Container(
                  height: 120.0,
                  width: 120.0,
                  padding: const EdgeInsets.all(15),
                  child: Image.asset(
                    AppAssets.rxLoader,
                    height: 50.0,
                    width: 50.0,
                  ),
                )
              ],
            ),
          )
              : Stack(
            children: <Widget>[
              ClipPath(
                clipper: MyCustomClipper(clipType: ClipType.bottom),
                child: Container(
                  color: AppColors.sonaPurple2,
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
                  scrollDirection: Axis.vertical,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            // Back Button
                            SizedBox(
                              width: 34,
                              child: RawMaterialButton(
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                onPressed: () {
                                  serviceLocator.get<NavigationService>().pop();
                                },
                                child: Icon(Icons.arrow_back_ios,
                                    size: 25.0, color: Colors.white),
                              ),
                            ),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  widget.data!["data"].name,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "Pharmacy",
                                  style: TextStyle(
                                      fontSize: 24, color: Colors.white),
                                )
                              ],
                            ),
                          ],
                        ),
                        Spacer(),
                        Image(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/icons/heartbeatthin.png'),
                            height: 73,
                            width: 80,
                            color: Colors.white.withOpacity(1)),
                      ],
                    ),
                    SizedBox(height: 30),
                    // Chart
                    Material(
                      shadowColor: Colors.grey.withOpacity(0.01), // added
                      type: MaterialType.card,
                      elevation: 10,
                      borderRadius: new BorderRadius.circular(10.0),
                      child: Container(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Text(
                                  "Pharmacy Name",
                                  style: TextStyle(
                                      fontSize: 14.sp, color: Colors.black, fontWeight: FontWeight.w900,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  _pharmacyDetails!.value!.name!,
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      color: Colors.black),
                                ),

                              ],
                            ),
                            SizedBox(height: 30),
                            Column(
                              children: <Widget>[
                                Text(
                                  "Pharmacy Address",
                                  style: TextStyle(
                                    fontSize: 14.sp, color: Colors.black, fontWeight: FontWeight.w900,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  _pharmacyDetails!.value!.address!.streetAddress1! + ", " + _pharmacyDetails!.value!.address!.city!  + ", " + _pharmacyDetails!.value!.address!.usTerritory!,

                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      color: Colors.black),
                                ),

                              ],
                            ),
                          SizedBox(height: 30),
                            _pharmacyDetails!.value!.primaryPhoneNumber != null
                                ? Column(
                              children: <Widget>[
                                Text(
                                  "Pharmacy Phone Number",
                                  style: TextStyle(
                                    fontSize: 14.sp, color: Colors.black, fontWeight: FontWeight.w900,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  _pharmacyDetails!.value!.primaryPhoneNumber!,
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      color: Colors.black),
                                ),

                              ],
                            )
                                : SizedBox.shrink(),
                          SizedBox(height: 30),
                            _pharmacyDetails!.value!.pharmacyHours != null
                                ? Column(
                              children: <Widget>[
                                Text(
                                  "Pharmacy Hours",
                                  style: TextStyle(
                                    fontSize: 14.sp, color: Colors.black, fontWeight: FontWeight.w900,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  _pharmacyDetails!.value!.pharmacyHours!.replaceAll('\\n', '\n'),
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      color: Colors.black),
                                ),

                              ],
                            )
                                : SizedBox.shrink(),
                            SizedBox(height: 30),
                            SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: AppButton(
                                    buttonText: "Order Now".tr(),
                                    onPressed: () {
                                      showModalBottomSheet(
                                        isScrollControlled: true,
                                        context: context,
                                        builder: (context) => FractionallySizedBox(
                                        heightFactor: 0.9,
                                        child: OrderScreen(pharmacyDetails: _pharmacyDetails)),
                                      );
                                    }))
                          ],
                        ),
                      ), // added
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
