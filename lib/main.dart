import 'dart:async';
import 'dart:io';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'core/config/config.dart';
import 'core/datasource/key.dart';
import 'core/datasource/local_storage.dart';
import 'core/models/response/UserResultModel.dart';
import 'core/navigation/generate_route.dart';
import 'core/navigation/keys.dart';
import 'core/navigation/navigation_service.dart';
import 'core/network/http_overrider.dart';
import 'core/startup/app_startup.dart';
import 'core/utils/images.dart';
import 'core/utils/theme.dart';


void main()  async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  HttpOverrides.global = AppHttpOverrides();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await initLocator();

  runZonedGuarded<Future<void>>(() async {
    runApp(
      DevicePreview(
          enabled: false,
          builder: (context) => EasyLocalization(
            supportedLocales: [Locale('en', 'US')],
            path: 'assets/translations',
            fallbackLocale: Locale('en', 'US'),
            child: const MyApp(),
          )),
    );
  }, (error, stackTrace) async {
    if (AppConfig.environment != Environment.staging) {
      // final Event event = await getSentryEvent(error, stackTrace: stackTrace);
      // sentry.capture(event: event);
    }
  });
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool _isLogedin = false;
  UserResultData? userResultData;
  var connectionListener;
  bool hasInternetConnection = false;


  @override
  void initState() {
    super.initState();
    data();
    // actively listen for status updates
    // this will cause InternetConnectionChecker to check periodically
    // with the interval specified in InternetConnectionChecker().checkInterval
    // until listener.cancel() is called
    connectionListener = InternetConnectionChecker().onStatusChange.listen((status) {
      switch (status) {
        case InternetConnectionStatus.connected:
          setState(() {
            hasInternetConnection = true;
          });
          print('Data connection is available.');
          break;
        case InternetConnectionStatus.disconnected:
          setState(() {
            hasInternetConnection = false;
          });
          print('You are disconnected from the internet.');
          break;
      }
    });
    //print("isActivelyChecking: ${InternetConnectionChecker().isActivelyChecking}");
  }


  data() async {
    if (serviceLocator.isRegistered<LocalStorage>()) {
      await _isLogedinCheck();
    }
  }

  Future<bool> _isLogedinCheck() async {
    _isLogedin = (await GetIt.I.get<LocalStorage>().readBool(LocalStorageKeys.kLoginPrefs))!;
    print("Token: "+_isLogedin.toString());
    if (_isLogedin) {
      // userResultData = await GetIt.I.get<LocalStorage>().readSecureObject(LocalStorageKeys.kUserPrefs);
      }
    return _isLogedin;
  }

  @override
  Widget build(BuildContext context) {
    //uncomment to reset locale
    //context.setLocale(Locale('en', 'US'));

    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: false,
        builder: (context, widget) {
          return AdaptiveTheme(
              light: ThemeData(
                brightness: Brightness.light,
                primarySwatch: Colors.red,
                accentColor: Colors.amber,
              ),
              dark: ThemeData(
                brightness: Brightness.dark,
                primarySwatch: Colors.red,
                accentColor: Colors.amber,
              ),
              initial: AdaptiveThemeMode.light,
              builder: (theme, darkTheme) => MaterialApp(
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                locale: context.locale,
                theme: AppTheme.lightThemeData(),
                debugShowCheckedModeBanner: false,
                // AppConfig.environment == Environment.staging,
                themeMode: ThemeMode.light,
                builder: (context, widget) {
                  ScreenUtil.init(context);
                  return MediaQuery(
                    data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                    child: GlobalLoaderOverlay(
                        overlayColor: Colors.black,
                        overlayOpacity: 0.8,
                        useDefaultLoading: false,
                        overlayWidget: SizedBox(
                          width: double.maxFinite,
                          height: double.maxFinite,
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
                                height: 80.0,
                                width: 80.0,
                                padding: const EdgeInsets.all(15),
                                child: Image.asset(
                                  AppAssets.rxLoader,
                                  height: 50.0,
                                  width: 50.0,
                                ),
                              )
                            ],
                          ),
                        ),
                        // child: hasInternetConnection
                        //     ? widget!
                        //     : ConnectionFailedScreen(),
                        child: widget!
                    ),
                  );
                },
                navigatorObservers: const [
                  // TODO
                  // FirebaseAnalyticsObserver(analytics: AppConfig.analytics),
                ],
                onGenerateRoute: generateRoute,
                initialRoute: RouteKeys.routeSplash,
                navigatorKey: GetIt.I.get<NavigationService>().navigatorKey,
              ));
        }
    );
  }
}