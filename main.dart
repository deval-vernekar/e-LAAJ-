import 'package:elaaj/authentication/login_page.dart';
import 'package:elaaj/authentication/verify.dart';
import 'package:elaaj/home/home.dart';
//import 'package:elaaj/pages/articles/article_info.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  //this for push navigation
static final navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    //define Themedata here
    return GetMaterialApp(
      title: 'Flutter Doctor App',
      theme: ThemeData(
        //pre-define Input Decoration
           fontFamily: "poppins",

      ),
      //this is initial route of the app
      debugShowCheckedModeBanner: false,
      initialRoute: 'login_page',
      routes: {'login_page' : (context) => LoginPage(),
               'verify' : (context) => VerifyPage(),
               'home' : (context) => HomePage(),
              // 'main': (context)=> const MainLayout(),
     },
      home:HomePage(),

    );
  }
}
