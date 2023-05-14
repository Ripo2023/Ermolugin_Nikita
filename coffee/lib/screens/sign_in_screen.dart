import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'check_code_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool isChecked = false;
  String numberErrorText = '';
  FirebaseAuth auth = FirebaseAuth.instance;
  _validateNumber() async {
            Navigator.push(context, MaterialPageRoute(builder: (context) => CheckCodeScreen()));
    if(numberController.text.isNotEmpty){
      await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: numberController.text,
      verificationCompleted: (PhoneAuthCredential credential) async{
        await auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
    } 
      },
      codeSent: (String verificationId, int? resendToken)async {
        String smsCode = 'xxxx';
        PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);
        await auth.signInWithCredential(credential);
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
);
    } else {
    numberErrorText = 'Некорректный ввод';
    setState(() {
      
    });
    }
  }
  //получение доступной либо недоступной кнопки в зависимоти от checkbox
  Widget _getContinueButton(){
    if(isChecked){
      return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: (){
              _validateNumber();
            },
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(17), color: Color.fromARGB(255, 235, 75, 27),),
              width: double.infinity,
              height: 60,
              child: const Center(child: Text('Continue', style: TextStyle(color: Colors.white, fontSize: 18,
              fontWeight: FontWeight.w500,),)),
            ),
          ),
        );
    } else {
      return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(17), color: Color.fromARGB(255, 167, 167, 167),),
            width: double.infinity,
            height: 60,
            child: const Center(child: Text('Continue', style: TextStyle(color: Colors.white, fontSize: 18,
            fontWeight: FontWeight.w500,),)),
          ),
        );
    }
  }

final numberController = TextEditingController();

 @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    numberController.dispose();
    super.dispose();
  }

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
    child: Text('Phone'),
  ),
  Padding(
    padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
    child: TextField(
      controller: numberController,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        errorText: numberErrorText,
        border: const OutlineInputBorder(),
      ),
    ),
  ),
  Row(
    children: [Checkbox(value: isChecked, onChanged: (bool? value){
      setState(() {
          isChecked = value!;
        });
    }),
    const Row(children: [
       Text('i\'m agree '),
       Text('with privacy ', style: TextStyle(color: Colors.blue),),
       Text('and '),
       Text('user agreement', style: TextStyle(color: Colors.blue),),
    ],)]
  )
],),
        ),
        _getContinueButton()
      ]),
    );
  }
}