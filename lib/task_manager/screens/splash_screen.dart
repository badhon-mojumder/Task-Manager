import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_manager/task_manager/screens/login_screen.dart';
import 'package:task_manager/task_manager/utils/asset_path.dart';
import 'package:task_manager/task_manager/widgets/screen_bg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    getLoginPage();
  }

  Future<void> getLoginPage() async {
    await Future.delayed(Duration(seconds: 3));
     Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBg(child: Center(
          child: Image.asset(AssetPath.logoImage, height: 200, width: 200,))),
    );
  }
}

