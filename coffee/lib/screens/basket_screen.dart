import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../models/menu_item.dart';

class BasketScreen extends StatefulWidget {
  BasketScreen({super.key, required this.basketItems});
    List<MenuItem> basketItems = [];

  @override
  State<BasketScreen> createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.large(onPressed: (){
        DatabaseReference orderRef = FirebaseDatabase.instance.ref('orders');
        widget.basketItems.forEach((element) {
            
        });
        List<Map<String, dynamic>> orderJson = [];
        widget.basketItems.forEach((element) {
            orderJson.add(element.toJson());          
         });
        
        final orderRefPush = orderRef.push();
        orderRefPush.set({
          "customer": FirebaseAuth.instance.currentUser?.phoneNumber,
          "order": orderJson
        });

      }, child: Icon(Icons.check),),
      body: Container(
        child: ListView.builder(
          itemCount: widget.basketItems.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 7,
                child: Column(children: [
                  Text(widget.basketItems[index].name, style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w600),),
                  SizedBox(height: 10,),
                  Text(widget.basketItems[index].volume, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),),
                  SizedBox(height: 10,),
                  Text(widget.basketItems[index].price, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),)
                ]),
              ),
            );
          }
        )
      ),
    );
  }
}