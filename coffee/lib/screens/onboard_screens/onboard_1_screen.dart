import 'package:coffee/screens/onboard_screens/onboard_2_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../products_screen.dart';
import '../sign_in_screen.dart';
import 'onboard_4_screen.dart';

class Onboard1Screen extends StatefulWidget {
  const Onboard1Screen({super.key});

  @override
  State<Onboard1Screen> createState() => Onboard1ScreenState();
}

class Onboard1ScreenState extends State<Onboard1Screen> {
 _setPrefs() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('seeOnboards', true);
    debugPrint('prefs set');
    
 }

  @override
  void initState() {
    _setPrefs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onHorizontalDragStart: (details) {
              Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => const Onboard2Screen()));
          },
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: GestureDetector(onTap: () {
                                          if(FirebaseAuth.instance.currentUser != null){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProductsScreen()));
                  } else {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SignInScreen()));
                  }
                      },
                        child: const Text('Skip', style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 235, 75, 27)),))),
                  ],
                ),
              ),
              Image.asset('assets/images/onboard1.png'),
              const Text('Hello!', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Text('Coffee to Go is an application in wich you can order coffe online and pick it up at the coffee shop closest to you. \nNow let\'s tell you how it works',
                textAlign: TextAlign.center,
                           style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16, color: Color.fromARGB(255, 63, 63, 63), letterSpacing: 1),),
              ),
              const SizedBox(height: 10,),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                ActiveDotWidget(), 
                DisableDotWidget(),
                DisableDotWidget(),
                DisableDotWidget(),
              ],),
              const SizedBox(height:60),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => const Onboard2Screen()));
                },
                child: Container(
                  width: 140,
                  height: 50,
                  decoration: BoxDecoration(color: const Color.fromARGB(255, 235, 75, 27), borderRadius: BorderRadius.circular(10)),
                  child: const Center(child: Text('Next', style: TextStyle(color: Colors.white),))),
              )
            ],
          ),
        ),
      ),
    );
  }
}