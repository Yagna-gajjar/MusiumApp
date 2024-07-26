import 'dart:async';
import 'package:flutter/material.dart';
import 'package:musium/screens/add_user_details.dart';
import 'package:musium/screens/bottom_navigation_bar.dart';
import 'package:musium/screens/get_started.dart';
import 'package:musium/utils/Controllers.dart';
import 'package:musium/utils/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3), () async {
      String? result = await Controllers.StringGet(key: 'email');
      bool getEmail = await _getEmail();
      if(!getEmail){
        // Navigator.push(context, MaterialPageRoute(builder: (context) => GetStarted()));
        Navigator.push(context, MaterialPageRoute(builder: (context) => AddUserDetails(email: "yagna@gmail.com",lan: 'en',username: 'yagna gajjar',password: 'Yagna@13'),));
      }
      else {
        Navigator.push(context, MaterialPageRoute(builder: (context) => MyNavigationBar()));
      }
    });
  }

  Future<bool> _getEmail() async {
    String? result = await Controllers.StringGet(key: 'email');
    if(result == null){
      return false;
    }
    else {
      return true;
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: Center(
        child: Image.asset('assets/musium_logo.png'),
      ),
    );
  }
}
