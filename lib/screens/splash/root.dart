
import 'dart:io';
import 'package:get_it/get_it.dart';
import 'package:nimble_simple/core/datasource/key.dart';
import 'package:nimble_simple/core/datasource/local_storage.dart';
import 'package:nimble_simple/core/enums/user_type.dart';
import 'package:nimble_simple/core/models/call/IncomingCallModel.dart';
import 'package:nimble_simple/core/models/response/UserResultModel.dart';
import 'package:nimble_simple/core/navigation/keys.dart';
import 'package:nimble_simple/core/navigation/navigation_service.dart';
import 'package:nimble_simple/core/startup/app_startup.dart';
import 'package:nimble_simple/core/utils/colors.dart';
import 'package:nimble_simple/core/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);


  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin, WidgetsBindingObserver {

  late bool isFirstTime;
  bool _isLogedin = false;
  UserResultData? userResultData;
  String? deviceToken;
  late IncomingCallModel? incomingCallModel;

  @override
  void initState() {
    super.initState();
    data();
  }

  data() async {
    //GetIt.I.get<LocalStorage>().clearAllExcept(LocalStorageKeys.kLoginEmailPrefs);
      if (serviceLocator.isRegistered<LocalStorage>()) {
        Future.delayed(const Duration(seconds: 3), () async {
          await _isLogedinCheck();
        });
      }
  }

  Future<bool> _isLogedinCheck() async {
    _isLogedin = (await GetIt.I.get<LocalStorage>().readBool(LocalStorageKeys.kLoginPrefs))!;
    //print("check: "+_isLogedin.toString());
    if (_isLogedin) {
      serviceLocator.get<NavigationService>().replaceWith(RouteKeys.routeBottomNavi);
    } else {
      serviceLocator.get<NavigationService>().replaceWith(RouteKeys.routeOnboarding);
    }
    return _isLogedin;
  }

  Future _checkFirstOpening() async {
    isFirstTime = await GetIt.I.get<LocalStorage>().readBool(LocalStorageKeys.khasOpenedAppBeforeKey) ?? false;
    if (isFirstTime) GetIt.I.get<LocalStorage>().writeBool(LocalStorageKeys.khasOpenedAppBeforeKey, false);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: AppColors.sonaWhite,
          ),
          Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 50.h),
              child: Image.asset(
                AppAssets.appIcon,
              ),
            ),
          ),
        ],
      )
    );
  }
}
