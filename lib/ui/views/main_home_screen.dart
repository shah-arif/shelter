import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shelter/ui/views/bottom_nav_controller/bottom_nav_bar.dart';
import 'package:shelter/ui/views/drawer_screen.dart';

class MainHomeScreen extends StatelessWidget {
  DateTime timeBackPressed = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        final difference = DateTime.now().difference(timeBackPressed);
        final isExitWarning = difference >= Duration(seconds: 2);
        timeBackPressed = DateTime.now();

        if (isExitWarning){
          final message = "Press back to exit";
          Fluttertoast.showToast(msg: message,fontSize: 18);
          return false;
        } else {
          Fluttertoast.cancel();
          return true;
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            DrawerScreen(),
            BottomNavBar()
          ],
        ),
      ),
    );
  }
}
