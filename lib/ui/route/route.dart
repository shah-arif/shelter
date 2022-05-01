import 'package:get/get.dart';
import 'package:shelter/ui/views/onboarding_screen.dart';
import 'package:shelter/ui/views/sign_up_screen.dart';
import 'package:shelter/ui/views/splash_screen.dart';

const String splah = '/splash-screen';
const String onboarding = '/onboarding-screen';
const String sign_up = '/sign-up';

//control page route flow

List <GetPage> getPages = [
  GetPage(name: splah, page: ()=> SplashScreen()),
  GetPage(name: onboarding, page: ()=> OnBoardingScreen()),
  GetPage(name: sign_up, page: ()=> SignUpScreen()),
];