import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DrawerItem extends StatelessWidget {
  final String itemName;
  final VoidCallback onClick;
  const DrawerItem({
    Key? key,
    required this.itemName,
    required this.onClick
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Text(itemName,style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w400),),
    );
  }
}