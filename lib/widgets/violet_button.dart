import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shelter/const/app_colors.dart';

class VioletButton extends StatelessWidget {
  RxBool _value = false.obs;
  final String title;
  final Function onAction;
  VioletButton({required this.title,required this.onAction});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return InkWell(
        onTap: () async{
          _value.value = true;
          await Future.delayed(Duration(seconds: 1));
          onAction();
          _value.value = false;
        },
        child: Container(
            height: 42.h,
            decoration: BoxDecoration(
              color: AppColors.violet_color,
              borderRadius: BorderRadius.all(Radius.circular(5.r)),
            ),
            child: _value == false ? Center(
              child: Text(
                title,
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17.sp,color: Colors.white),
              ),
            ) : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Please Wait",style: TextStyle(fontSize: 17.sp,fontWeight: FontWeight.w500,color: Colors.white),),
                SizedBox(width: 10.w,),
                Transform.scale(scale: 0.4,child: CircularProgressIndicator(color: Colors.white,))
              ],
            )
        ),
      );
    });
  }
}
