import 'package:get/get.dart';
import 'package:quitandaapp/src/pages/auth/view/signin_screen.dart';
import 'package:quitandaapp/src/pages/auth/view/signup_screen.dart';
import 'package:quitandaapp/src/pages/base/base_screen.dart';
import 'package:quitandaapp/src/pages/splash/splash_screen.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    GetPage(name: AppPagesRoutes.splash, page: () => const SplashScreen()),
    GetPage(name: AppPagesRoutes.signIn, page: () => SigInScreean()),
    GetPage(name: AppPagesRoutes.signUp, page: () => const SignUpScreen()),
    GetPage(name: AppPagesRoutes.home, page: () => const BaseScreen()),
  ];
}

abstract class AppPagesRoutes {
  static const String splash = '/';
  static const String signIn = '/signin';
  static const String signUp = '/signup';
  static const String home = '/home';
}
