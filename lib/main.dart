import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yoga_app_onboarding/pages/HomeScreen.dart';
import 'package:yoga_app_onboarding/pages/SplashScreen.dart';
import 'package:yoga_app_onboarding/size_config.dart';
import 'package:yoga_app_onboarding/style.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizeConfig().init(constraints, orientation);
        setupSystemSettings();
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: AppTheme.darkTheme,
          home: SplashScreen(),
          routes: {
            HomeScreen.routeName: (context) => HomeScreen(),
          },
        );
      });
    });
  }

  void setupSystemSettings() {
    // this will change color of status bar and system navigation bar
    SystemChrome.setSystemUIOverlayStyle(AppTheme.systemUiOverlayStyle);

    // this will prevent change oriontation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}
