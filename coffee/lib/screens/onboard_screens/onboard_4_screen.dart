import 'package:flutter/material.dart';

import '../sign_in_screen.dart';

class Onboard4Screen extends StatefulWidget {
  const Onboard4Screen({super.key});

  @override
  State<Onboard4Screen> createState() => _Onboard4ScreenState();
}

class _Onboard4ScreenState extends State<Onboard4Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('`', style: TextStyle(fontSize: 16, color: Colors.transparent),)
                  ],
                ),
              ),
              Image.asset('assets/images/onboard4.png'),
              const Text('Receiving an order', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Text('At the specified time, come to the coffee shop and enjoy the taste of coffee, without queuing and waiting.',
                textAlign: TextAlign.center,
                           style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16, color: Color.fromARGB(255, 63, 63, 63), letterSpacing: 1),),
              ),
              const SizedBox(height: 10,),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                DisableDotWidget(),
                DisableDotWidget(),
                DisableDotWidget(),
                ActiveDotWidget(), 
              ],),
              const SizedBox(height:60),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SignInScreen()));
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

class ActiveDotWidget extends StatelessWidget {
  const ActiveDotWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
        width: 12,
        height: 12,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: const Color.fromARGB(255, 235, 75, 27)),),
    );
  }
}

class DisableDotWidget extends StatelessWidget {
  const DisableDotWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
        width: 7,
        height: 7,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: Color.fromARGB(255, 255, 215, 215)),),
    );
  }
}