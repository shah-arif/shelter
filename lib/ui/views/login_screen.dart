import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shelter/bloc/auth.dart';
import 'package:shelter/const/app_colors.dart';
import 'package:shelter/ui/route/route.dart';
import 'package:shelter/ui/styles/style.dart';
import 'package:shelter/widgets/violet_button.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 80.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Login\nTo Your Account",
                  style: TextStyle(
                      fontSize: 36.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.violet_color),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  "Create your account and start your journey",
                  style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w300),
                ),
                SizedBox(
                  height: 80.h,
                ),
                TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: AppStyles().textFieldDecoration("E-mail Address"),),
                TextFormField(
                  controller: _passwordController,
                  keyboardType: TextInputType.text,
                  decoration: AppStyles().textFieldDecoration("Enter Password"),
                ),
                SizedBox(height: 40.h,),
                VioletButton(title: "Log In",onAction: ()=>Auth().login(_emailController.text, _passwordController.text, context)),
                SizedBox(height: 10.h,),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "--OR--",
                    style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w300),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(onPressed: (){}, icon: Image.asset("assets/icons/google.png")),
                    IconButton(onPressed: (){}, icon: Image.asset("assets/icons/facebook.png")),
                  ],
                ),
                SizedBox(height: 10.h,),
                Align(
                  alignment: Alignment.center,
                  child: RichText(text: TextSpan(
                    text: 'Don\'t have registered yet?',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w300,
                      color: Colors.black
                    ),
                    children: [
                      TextSpan(
                        text: ' Sign Up',
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          color: AppColors.violet_color
                        ),
                        recognizer: TapGestureRecognizer()..onTap = ()=>Get.toNamed(sign_up)
                      )
                    ]
                  )),
                )


              ],
            ),
          ),
        ),
      ),
    );
  }
}
