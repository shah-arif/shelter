import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shelter/ui/route/route.dart';
import 'package:shelter/widgets/violet_button.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PrivacyPolicy extends StatelessWidget {
  PdfViewerController? _pdfViewerController;
  RxBool _loaded = false.obs;
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(child: SfPdfViewer.network("http://www.africau.edu/images/default/sample.pdf",onDocumentLoaded: (PdfDocumentLoadedDetails details){
                _loaded.value = true;
              },)),
              SizedBox(height: 25.h,),
              Obx(() {
                return _loaded == true ?VioletButton(title: "Agree", onAction: (){
                  box.write("permission", "Privacy & Policy Accepted");
                  Get.toNamed(bottom_nav_bar);
                }) : CircularProgressIndicator();
              }),
              SizedBox(height: 25.h,)
            ],
          ),
        )
      ),
    );
  }
}
