import 'package:get/get.dart';
import 'package:shelter/ui/views/bottom_nav_controller/bottom_nav_bar.dart';
import 'package:shelter/ui/views/dtawer_pages/faq.dart';
import 'package:shelter/ui/views/dtawer_pages/how_to_use.dart';
import 'package:shelter/ui/views/dtawer_pages/privacy.dart';
import 'package:shelter/ui/views/dtawer_pages/rate_us.dart';
import 'package:shelter/ui/views/dtawer_pages/settings.dart';
import 'package:shelter/ui/views/dtawer_pages/support.dart';
import 'package:shelter/ui/views/login_screen.dart';
import 'package:shelter/ui/views/main_home_screen.dart';
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
const String main_home_screen = '/main-home-screen';
//Drawer Routes
const String support = '/support-screen';
const String privacy = '/privacy-screen';
const String faq = '/faq-screen';
const String rate_us = '/rate-us-screen';
const String how_to_use = '/how-to-use-screen';
const String settings = '/settings-screen';






//control page route flow

List <GetPage> getPages = [
  GetPage(name: splah, page: ()=> SplashScreen()),
  GetPage(name: onboarding, page: ()=> OnBoardingScreen()),
  GetPage(name: sign_up, page: ()=> SignUpScreen()),
  GetPage(name: log_in, page: ()=> LoginScreen()),
  GetPage(name: user_form, page: ()=> UserForm()),
  GetPage(name: privacy_policy, page: ()=> PrivacyPolicy()),
  GetPage(name: main_home_screen, page: ()=> MainHomeScreen()),
  //Drawer Routes
  GetPage(name: support, page: ()=> SupportScreen()),
  GetPage(name: privacy, page: ()=> PrivacyScreen()),
  GetPage(name: faq, page: ()=> FAQScreen()),
  GetPage(name: rate_us, page: ()=> RateUsScreen()),
  GetPage(name: how_to_use, page: ()=> HowToUseScreen()),
  GetPage(name: settings, page: ()=> SettingsScreen()),
];