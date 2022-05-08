import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shelter/widgets/violet_button.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(child: Container(
                color: Colors.grey,
                child: Center(child: Text("Privacy Policy SCreen"),),
              )),
              SizedBox(height: 25.h,),
              VioletButton(title: "Agree", onAction: (){}),
              SizedBox(height: 25.h,)
            ],
          ),
        )
      ),
    );
  }
}
