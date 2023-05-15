import 'dart:async';
import 'package:coffee/screens/products_screen.dart';
import 'package:coffee/screens/sign_in_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'onboard_screens/onboard_1_screen.dart';
// ignore: must_be_immutable
class SplashScreen extends StatelessWidget {
  
  SplashScreen({super.key});

     bool? isSeeOnboards = false;

  _getPrefs() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    isSeeOnboards = prefs.getBool('seeOnboards');
    debugPrint(isSeeOnboards.toString());
    return isSeeOnboards;
  }

  Widget _getHomePage(){
    return FutureBuilder(future: _getPrefs(),
    builder: (context, snapshot){
      if(snapshot.hasData){
        if(isSeeOnboards == true){
          if(FirebaseAuth.instance.currentUser?.phoneNumber != null){
            // FirebaseAuth.instance.signOut();
            debugPrint(FirebaseAuth.instance.currentUser?.phoneNumber);
            
            return const ProductsScreen();
          } else{
            return const SignInScreen();
          }
        } else {
          return const Onboard1Screen();
        }
      } else{
          return const Onboard1Screen();
      }
    },);
  }

  _getRenderedLogo(){
    const String assetName = 'assets/images/logo.svg';
    final Widget svg = SvgPicture.asset(
  assetName,
  semanticsLabel: 'Acme Logo'
    );
    return svg;
  }

  Widget _viewSplashScreenDuration(BuildContext context){
    //Задержка в две секунды перед отправкой на след экран
    Timer(Duration(seconds: 2), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => _getHomePage()));
    });
    return Text('');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          colors: [Color.fromARGB(255, 255, 200, 163), Color.fromARGB(255, 255, 189, 230)])
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image.asset('assets/images/Square.png')),
          Container(
            width: 110,
            child: _getRenderedLogo(),),
          _viewSplashScreenDuration(context)
        ],
      ),
      ),
    );
  }
}