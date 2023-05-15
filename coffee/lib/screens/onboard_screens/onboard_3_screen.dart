import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../products_screen.dart';
import '../sign_in_screen.dart';
import 'onboard_4_screen.dart';

class Onboard3Screen extends StatefulWidget {
  const Onboard3Screen({super.key});

  @override
  State<Onboard3Screen> createState() => _Onboard3ScreenState();
}

class _Onboard3ScreenState extends State<Onboard3Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
            onHorizontalDragStart: (details) {
              Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => const Onboard4Screen()));
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
              Image.asset('assets/images/onboard3.png'),
              const Text('Making an order', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Text('Choose your favorite drinks and desserts. You can change their composition and choose the time when it will be convenient for you to pick them up.',
                textAlign: TextAlign.center,
                           style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16, color: Color.fromARGB(255, 63, 63, 63), letterSpacing: 1),),
              ),
              const SizedBox(height: 10,),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                DisableDotWidget(),
                DisableDotWidget(),
                ActiveDotWidget(), 
                DisableDotWidget(),
              ],),
              const SizedBox(height:60),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => const Onboard4Screen()));
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