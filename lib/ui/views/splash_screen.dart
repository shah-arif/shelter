import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shelter/const/app_string.dart';
import 'package:shelter/ui/route/route.dart';
import 'package:shelter/ui/styles/style.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final box = GetStorage();
  Future chooseScreen() async {
    var userId = box.read('uid');
    var permission = box.read("permission");
    var userfomSubmitted = box.read("userfomSubmitted");
    var checkOnBoarding = box.read("checkOnBoarding");

    if (userId == null) {
      if (checkOnBoarding == null) {
        Get.offAndToNamed(onboarding);
      } else {
        Get.offAndToNamed(sign_up);
      }
    } else {
      Get.offAndToNamed(user_form);
      if (userfomSubmitted == null) {
      } else {
        Get.offAndToNamed(privacy_policy);
        if (permission == null) {
        } else {
          Get.offAndToNamed(main_home_screen);
        }
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3), () => chooseScreen());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlutterLogo(
                size: 100.w,
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                AppString.app_title,
                style: AppStyles().myTextStyle,
              )
            ],
          ),
        ),
      ),
    );
  }
}
