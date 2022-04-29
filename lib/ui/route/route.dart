import 'package:get/get.dart';
import 'package:shelter/ui/views/onboarding_screen.dart';
import 'package:shelter/ui/views/splash_screen.dart';

const String splah = '/splash-screen';
const String onboarding = '/onboarding-screen';

//control page route flow

List <GetPage> getPages = [
  GetPage(name: splah, page: ()=> SplashScreen()),
  GetPage(name: onboarding, page: ()=> OnBoardingScreen()),
];