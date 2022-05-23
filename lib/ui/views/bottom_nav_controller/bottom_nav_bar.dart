import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shelter/const/app_string.dart';
import 'package:shelter/ui/views/bottom_nav_controller/pages/nav_add.dart';
import 'package:shelter/ui/views/bottom_nav_controller/pages/nav_fav.dart';
import 'package:shelter/ui/views/bottom_nav_controller/pages/nav_home.dart';

class BottomNavBar extends StatelessWidget {
  RxInt _currentIndex = 0.obs;
  RxBool _drawer = false.obs;

  final _pages = [
    NavHome(),
    NavAdd(),
    NavFav(),
  ];


  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return AnimatedPositioned(
        top: _drawer.value == false ? 0 : 100.h,
        bottom: _drawer.value == false ? 0 : 100.h,
        left: _drawer.value == false ? 0 : 200.w,
        right: _drawer.value == false ? 0 : -100.w,
        duration: Duration(milliseconds: 200),
        child: Container(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              leading: _drawer.value == false ? IconButton(
                  onPressed: () {
                    _drawer.value = true;
                  },
                  icon: Icon(
                    Icons.menu,
                    color: Colors.black,
                  )) : IconButton(
                  onPressed: () {
                    _drawer.value = false;
                  },
                  icon: Icon(
                    Icons.close,
                    color: Colors.black,
                  )),
              title: Text(
                AppString.app_title,
                style: TextStyle(color: Colors.black),
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
                currentIndex: _currentIndex.value,
                onTap: (value) => _currentIndex.value = value,
                items: [
                  BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                  BottomNavigationBarItem(icon: Icon(Icons.add), label: "Add"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.favorite_outline), label: "Favourite"),
                ]),
            body: _pages[_currentIndex.value],
          ),
        ),
      );
    });
  }
}

