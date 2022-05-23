import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shelter/bloc/user_info.dart';
import 'package:shelter/const/app_colors.dart';
import 'package:shelter/ui/route/route.dart';
import 'package:shelter/ui/styles/style.dart';
import 'package:shelter/widgets/form_field.dart';
import 'package:shelter/widgets/violet_button.dart';
import 'package:toggle_switch/toggle_switch.dart';

class UserForm extends StatelessWidget {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _dobController = TextEditingController();
  String? dob;
  String gender = "Male";
  final box = GetStorage();

  DateTime selectedDate = DateTime.now();
  selectDate(context)async{
    final selected = await showDatePicker(context: context, initialDate: selectedDate, firstDate: DateTime(1950), lastDate: DateTime.now());
    if(selected != null && selected !=selectedDate){
      _dobController.text = "${selected.day}-${selected.month}-${selected.year}";
    }
  }

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
                  "Tell Us More About You",
                  style: TextStyle(
                      fontSize: 32.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.violet_color),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  "We will not share your information outside this application",
                  style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w300),
                ),
                SizedBox(
                  height: 80.h,
                ),
                MyFormField(controller: _nameController, hint: "Name", inputType: TextInputType.name),
                MyFormField(controller: _phoneController, hint: "Phone", inputType: TextInputType.phone),
                MyFormField(controller: _addressController, hint: "Address", inputType: TextInputType.streetAddress),
                TextFormField(
                  controller: _dobController,
                  readOnly: true,
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(onPressed: ()=>selectDate(context), icon: Icon(Icons.calendar_month)),
                    hintText: "Date of Birth",
                    hintStyle: TextStyle(
                      fontSize: 15.sp
                    )
                  ),
                ),
                SizedBox(height: 10.h),
                ToggleSwitch(
                  initialLabelIndex: 0,
                  totalSwitches: 2,
                  labels: ['Male', 'Female'],
                  onToggle: (index){
                    if(index == 0){
                      gender = "Male";
                    } else {
                      gender = "Female";
                    }
                  },
                ),
                SizedBox(height: 80.h),
                VioletButton(title: "Submit", onAction: (){
                  UsersInfo().sendFormDataToDB(_nameController.text, int.parse(_phoneController.text), _addressController.text, _dobController.text, gender);
                  box.write("userfomSubmitted", "User form data collected");
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


