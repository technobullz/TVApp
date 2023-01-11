import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:max_supreme_flutter/view/splash_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'controller/handle_screen_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    //statusBarIconBrightness: Brightness.dark
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => Shortcuts(
        shortcuts: <LogicalKeySet, Intent>{
          LogicalKeySet(LogicalKeyboardKey.select): ActivateIntent(),
        },
        child: GetMaterialApp(
          initialBinding: BaseBindings(),
          debugShowCheckedModeBanner: false,
          title: 'Maxx Supreme',
          theme: ThemeData(
            focusColor: Colors.white,
            primarySwatch: Colors.blue,
          ),
          home: SplashScreen(),
        ),
      ),
    );
  }
}

class BaseBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HandleScreenController(), fenix: true);
  }
}

// Shortcuts(
// shortcuts: <LogicalKeySet, Intent>{
// LogicalKeySet(LogicalKeyboardKey.select): ActivateIntent(),
// },
