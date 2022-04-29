import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shelter/const/app_colors.dart';
import 'package:shelter/ui/styles/style.dart';

class OnBoardingScreen extends StatelessWidget {
  List<String> _lottieFiles = [
    'assets/files/welcome.json',
    'assets/files/catagories.json',
    'assets/files/support.json'
  ];
  List<String> _title = ['Welcome', 'Catagories', 'Support'];
  List<String> _description = [
    'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
    'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
    'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
  ];

  RxInt _currentIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(32.w),
        child: Column(
          children: [
            Obx(() {
              return Expanded(
                  flex: 2,
                  child: Lottie.asset(_lottieFiles[_currentIndex.toInt()]));
            }),
            Expanded(child: Container(decoration: BoxDecoration(
                color: AppColors.scaffold_color,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(4.0, 4.0),
                    blurRadius: 10,
                    spreadRadius: 1.0,
                  ),
                  BoxShadow(
                      color: Colors.white,
                      offset: Offset(-4.0, -4.0),
                      blurRadius: 5,
                      spreadRadius: 1.0
                  )
                ]),
              child: Padding(
                padding: EdgeInsets.all(30.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(() {
                      return Text('${_title[_currentIndex.toInt()]}',
                          style: AppStyles().myTextStyle);
                    }),
                    Obx(() {
                      return Text('${_description[_currentIndex.toInt()]}');
                    }),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(() {
                          return DotsIndicator(
                            dotsCount: _lottieFiles.length,
                            position: _currentIndex.toDouble(),
                            decorator: DotsDecorator(),
                          );
                        }),
                        InkWell(
                          onTap: () {
                            if(_currentIndex == 2){
                              print("finished");
                            }else{
                              _currentIndex +1;
                            }
                          },
                          child: Container(
                            height: 37.h,
                            width: 37.w,
                            decoration: BoxDecoration(
                                color: AppColors.scaffold_color,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black26,
                                      offset: Offset(4.0, 4.0),
                                      blurRadius: 10,
                                      spreadRadius: 1.0
                                  ),
                                  BoxShadow(
                                      color: Colors.white,
                                      offset: Offset(-4.0, -4.0),
                                      blurRadius: 10,
                                      spreadRadius: 1.0
                                  )
                                ]
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),))
          ],
        ),
      ),
    );
  }
}
