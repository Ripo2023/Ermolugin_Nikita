import 'package:coffee/screens/products_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckCodeScreen extends StatefulWidget {
  const CheckCodeScreen({super.key});

  @override
  State<CheckCodeScreen> createState() => _CheckCodeScreenState();
}
  String globalError = '';
  final codeController = TextEditingController();
  String numberErrorText = '';
class _CheckCodeScreenState extends State<CheckCodeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign in', style: TextStyle(fontWeight: FontWeight.w500),),
      centerTitle: true,),
      body: ListView(children: [
        Divider(),
        Image.asset('assets/images/signinimage.png'),
        Container(
decoration: BoxDecoration(
  borderRadius: BorderRadius.circular(10)),
child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Center(
      child: Container(
        width: 50,
        height: 6,
        decoration: BoxDecoration(color: const Color.fromARGB(255, 206, 206, 206), borderRadius: BorderRadius.circular(50)),
      ),
    ),
  const Padding(
    padding: EdgeInsets.all(10.0),
    child: Text('Code'),
  ),
  Padding(
    padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
    child: TextField(
      controller: codeController,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        errorText: numberErrorText,
        border: const OutlineInputBorder(),
      ),
    ),
  ),
],),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () async{
              if(FirebaseAuth.instance.currentUser != null){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const ProductsScreen()));
              }
            },
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(17), color: Color.fromARGB(255, 235, 75, 27),),
              width: double.infinity,
              height: 60,
              child: const Center(child: Text('Sign in', style: TextStyle(color: Colors.white, fontSize: 18,
              fontWeight: FontWeight.w500,),)),
            ),
          ),
        )
      ]),
    );
  }
}