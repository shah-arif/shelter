import 'package:get/get.dart';
import 'package:shelter/ui/views/bottom_nav_controller/bottom_nav_bar.dart';
import 'package:shelter/ui/views/login_screen.dart';
import 'package:shelter/ui/views/onboarding_screen.dart';
import 'package:shelter/ui/views/privacy_policy_screen.dart';
import 'package:shelter/ui/views/sign_up_screen.dart';
import 'package:shelter/ui/views/splash_screen.dart';
import 'package:shelter/ui/views/user_form_screen.dart';

const String splah = '/splash-screen';
const String onboarding = '/onboarding-screen';
const String sign_up = '/sign-up';
const String log_in = '/log-in';
const String user_form = '/user-form';
const String privacy_policy = '/privacy-policy';
const String bottom_nav_bar = '/bottom-nav-bar';

//control page route flow

List <GetPage> getPages = [
  GetPage(name: splah, page: ()=> SplashScreen()),
  GetPage(name: onboarding, page: ()=> OnBoardingScreen()),
  GetPage(name: sign_up, page: ()=> SignUpScreen()),
  GetPage(name: log_in, page: ()=> LoginScreen()),
  GetPage(name: user_form, page: ()=> UserForm()),
  GetPage(name: privacy_policy, page: ()=> PrivacyPolicy()),
  GetPage(name: bottom_nav_bar, page: ()=> BottomNavBar()),
];