import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shelter/const/app_string.dart';
import 'package:shelter/ui/route/route.dart';
import 'package:shelter/widgets/drawer_item.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Padding(
        padding: EdgeInsets.only(left: 20.w, top: 50.h, bottom: 20.h),
        child: Column(
          children: [
            Text(
              AppString.app_title,
              style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.w500),
            ),
            Text(
              "Travel Agency",
              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w300),
            ),
            SizedBox(
              height: 20.h,
            ),
            DrawerItem(
                itemName: "Support", onClick: () => Get.toNamed(support)),
            DrawerItem(
                itemName: "Privacy", onClick: () => Get.toNamed(privacy)),
            DrawerItem(itemName: "FAQ", onClick: () => Get.toNamed(faq)),
            DrawerItem(
                itemName: "Rate Us", onClick: () => Get.toNamed(rate_us)),
            DrawerItem(
                itemName: "How to use", onClick: () => Get.toNamed(how_to_use)),
            Expanded(child: SizedBox()),
            InkWell(
                onTap: () => Get.toNamed(settings),
                child: Text(
                  "Settings",
                  style:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
                ))
          ],
        ),
      ),
    );
  }
}
