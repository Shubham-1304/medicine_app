import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicine_app/main/main_screen.dart';
import 'package:medicine_app/utils/app_theme/app_config.dart';
import 'package:medicine_app/utils/app_theme/app_theme.dart';
import 'package:medicine_app/utils/app_theme/app_theme_light.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late AppTheme _appTheme;

  @override
  void initState() {
    super.initState();
    _appTheme = AppThemeLight();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppConfig(
      appTheme: _appTheme,
      child: ScreenUtilInit(
        useInheritedMediaQuery: true,
        builder: (_, Widget? child) {
          return MaterialApp(
              title: 'Sunidhi Creation',
              theme: ThemeData(
                useMaterial3: true,
                fontFamily: 'euclid_circular',
                brightness: Brightness.light,
                visualDensity: VisualDensity.adaptivePlatformDensity,
                primaryColor: _appTheme.themeSecondaryColor,
                scaffoldBackgroundColor: _appTheme.themePrimaryColor,
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
              ),
              // onGenerateRoute: AppRouter.routes,
              debugShowCheckedModeBanner: false,
              home: child
              // routes: {
              //   SplashScreen.routeName: (context) => const SplashScreen(),
              //   // HomeScreen.routeName: (context) => const HomeScreen(),
              //   MainScreen.routeName: (context) => const MainScreen(),
              //   AuthScreen.routeName: (context) => const AuthScreen(),
              //   AdminMainScreen.routeName: (context) =>
              //       const AdminMainScreen(),
              //   HomeDrawer.routeName: (context) => const HomeDrawer(),
              //   ProductScreen.routeName: (context) => const ProductScreen(),
              // },
              );
        },
        // child: Scaffold(
        //   body: Center(
        //     child: TextButton(
        //       onPressed: () async {
        //         // log("EXCEPTION TRIGGERED");
        //         // FirebaseCrashlytics.instance.log("TEST LOG");
        //         // throw Exception("testing crashlytics");
        //         try {
        //           throw Exception("testing crashlytics4");
        //         } catch (error, stack) {
        //           log("EXCEPTION TRIGGERED24");
        //           // await FirebaseCrashlytics.instance.recordError(error,stack);
        //           FirebaseCrashlytics.instance.setCustomKey('str_key', 'hello');
        //           FirebaseCrashlytics.instance.log("TESTing LOG4: $error");
        //           await FirebaseCrashlytics.instance.recordError(
        //             error,
        //             stack,
        //             reason: 'a non-fatal error',
        //             information: [
        //               'further diagnostic information about the error',
        //               'version 2.0'
        //             ],
        //           );
        //         }
        //       },
        //       child: const Text("Throw Test Exception"),
        //     ),
        //   ),
        // ),
        child: const MainScreen(),
      ),
    );
  }
}
