import 'package:flutter/material.dart';
import 'package:flutter_code_base/constants/constants.dart';
import 'package:flutter_code_base/helper/image_helper/asset_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(milliseconds: 3000),
      () {
        pushReplacementNamed(context, RouteConstants.home);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetHelper.splash),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
