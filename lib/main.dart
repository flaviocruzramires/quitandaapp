import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quitandaapp/src/pages/auth/controller/auth_controller.dart';
import 'package:quitandaapp/src/pages_routes/app_pages.dart';
import 'package:quitandaapp/src/services/styles_services.dart';

void main() {
  Get.put(AuthController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Quitanda App',
      debugShowCheckedModeBanner: false,
      themeMode: StylesServices.defaultThemeMode,
      theme: StylesServices.defaultTheme(),
      //home: const SplashScreen(),
      initialRoute: AppPagesRoutes.splash,
      getPages: AppPages.pages,
    );
  }
}
