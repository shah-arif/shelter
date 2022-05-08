import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shelter/const/app_colors.dart';
import 'package:shelter/const/app_string.dart';
import 'package:shelter/ui/route/route.dart';
import 'package:shelter/ui/views/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(App());
}

class App extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp(
      name: "Shelter",
      options: FirebaseOptions(
          apiKey: "AIzaSyDHECTfTr03XmJ_q7jo_XH4Lv6WilVwAGE",
          appId: "1:720853645134:android:4671eeb297e2cd5b55901f",
          messagingSenderId: "720853645134",
          projectId: "shelter-bf7a8"));

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return MyApp();
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(428, 926),
      builder: (_) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: AppString.app_title,
          theme: ThemeData(
              primarySwatch: Colors.blue,
              textTheme: GoogleFonts.poppinsTextTheme(
                  Theme.of(context).textTheme.apply()),
              scaffoldBackgroundColor: AppColors.scaffold_color),
          initialRoute: splah,
          getPages: getPages,
          home: const SplashScreen(),
        );
      },
    );
  }
}
