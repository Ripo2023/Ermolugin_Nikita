
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'orders_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final emailAdressController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                controller: emailAdressController,
                decoration: const InputDecoration(hintText: "Почта", border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.visiblePassword,
                controller: passwordController,
                decoration: const InputDecoration(hintText: "Пароль", border: OutlineInputBorder()),
              ),
            ),
            GestureDetector(
              onTap: () async{
                if(emailAdressController.text.length > 0){
                try {
                    final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: emailAdressController.text,
                      password: passwordController.text
                    );
                    Navigator.push(context, MaterialPageRoute(builder: (context) => OrdersScreen()));
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'user-not-found') {
                      print('No user found for that email.');
                    } else if (e.code == 'wrong-password') {
                      print('Wrong password provided for that user.');
                    }
                  }
                  } else{
                    debugPrint('invalid');
                    
                  }
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: const Color.fromARGB(255, 235, 75, 27)),
                  child: Center(child: Text('Войти', style: TextStyle(fontSize: 18, color: Colors.white),),),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}