import 'package:flutter/material.dart';
import '../sign_in_screen.dart';
import 'onboard_3_screen.dart';
import 'onboard_4_screen.dart';

class Onboard2Screen extends StatefulWidget {
  const Onboard2Screen({super.key});

  @override
  State<Onboard2Screen> createState() => _Onboard2ScreenState();
}

class _Onboard2ScreenState extends State<Onboard2Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
            onHorizontalDragStart: (details) {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Onboard3Screen()));
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
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignInScreen()));
                      },
                        child: const Text('Skip', style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 235, 75, 27)),))),
                  ],
                ),
              ),
              Image.asset('assets/images/onboard2.png'),
              const Text('Search for a coffee shop', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Text('The map shows the nearest coffee shops to you, choose the most convenient one for you. The app will tell you how long to go to it',
                textAlign: TextAlign.center,
                           style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16, color: Color.fromARGB(255, 63, 63, 63), letterSpacing: 1),),
              ),
              const SizedBox(height: 10,),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                DisableDotWidget(),
                ActiveDotWidget(), 
                DisableDotWidget(),
                DisableDotWidget(),
              ],),
              const SizedBox(height:60),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Onboard3Screen()));
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