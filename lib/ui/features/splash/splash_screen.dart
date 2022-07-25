
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


import '../../../constants/app_images.dart';
import '../../../constants/font_family.dart';
import '../home/views/home_view.dart';


class SplashScreen extends StatefulWidget {


  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>  {

  //variables:-----------------------------------------------------------------

  //Navigation :----------------------------------------------------------------
  void navigationPage() {
    Navigator.pushAndRemoveUntil(
      context, MaterialPageRoute(
        builder: (context) => HomeView()),
          (route) => false,);
  }

  startTime() async {
    var _duration =  const Duration(seconds: 3);
    return  Timer(_duration, navigationPage);
  }


  @override
  void initState() {
    super.initState();
    startTime();
  }


  @override
  dispose() {
    super.dispose();
  }


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: _buildBody(),
      ),
    );

  }

  // body methods:--------------------------------------------------------------
  Widget _buildBody() {
    return Stack(
      children: <Widget>[
        _buildMainContent(),
        _handleErrorMessage(),
        _buildLoading(),
        _buildResponse(),
      ],
    );
  }

  Widget _buildMainContent(){
    return Container(
        color: Colors.black,
        child: Stack(
          children: [

            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    AppImages.appLogo,
                    fit: BoxFit.contain,
                    height: MediaQuery.of(context).size.width*0.4,
                    width: MediaQuery.of(context).size.width*0.4,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: RichText(
                        text: const TextSpan(
                            text:"Vibrez avec ",
                            style: TextStyle(
                                color: Colors.white54,
                                fontSize: 16,
                                fontFamily: AppFonts.manropeRegular,
                                decoration: TextDecoration.none
                            ),
                            children: [
                              TextSpan(
                                text:"LBMusic Player",
                                style: TextStyle(
                                    color: Colors.white54,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w800,
                                    fontFamily: AppFonts.manropeBold,
                                    decoration: TextDecoration.none
                                ),
                              )
                            ]
                        )
                    ),
                  ),
                ],
              ),
            ),


            Positioned(
              bottom:30,
              left: 0,
              right: 0,
              child: Container(),
            ),

          ],
        ));
  }

  Widget _handleErrorMessage() {
    return SizedBox.shrink();
  }

  Widget _buildLoading() {
    return SizedBox.shrink();
  }

  Widget _buildResponse() {
    return Column(
      children: [
      ],
    );
  }


  /// General Methods:-----------------------------------------------------------
  _showErrorMessage() {

    return SizedBox.shrink();
  }
}
