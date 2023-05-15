import 'dart:convert';

import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'menu_item.dart';
import 'order.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}
class _OrdersScreenState extends State<OrdersScreen> {
  List<Order> ordersList = [];

  _getOrders() async{
    DatabaseReference ordersRef = FirebaseDatabase.instance.ref('orders');
    ordersRef.orderByChild('customer').onChildAdded.listen((event) {
      
    final orderData = event.snapshot.value;
    String orderJson = jsonEncode(orderData);
    Map<String, dynamic> orderMap = jsonDecode(orderJson);
    Order order = Order.fromJson(orderMap);
    ordersList.add(order);
    debugPrint(order.customer);
    setState(() {
    });
    });
  }
int currentQrIndex = -1;
Widget _buildBottomSheet(
    BuildContext context,
    ScrollController scrollController,
    double bottomSheetOffset,
  ) {
    return Material(
        child: Container(
          child: Center(child: QrImageView(
  data: '${ordersList[currentQrIndex].customer}\n${ordersList[currentQrIndex].order[currentQrIndex]['name']}\n${ordersList[currentQrIndex].order[currentQrIndex]['volume']}\n${ordersList[currentQrIndex].order[currentQrIndex]['price']}',
  version: QrVersions.auto,
  size: 400.0,
  foregroundColor: const Color.fromARGB(255, 235, 75, 27),
),),
        ));}

  @override
  void initState() {
    _getOrders();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    //генерация списка заказов
        return Scaffold(
          body: ListView.builder(
              itemCount: ordersList.length,
              itemBuilder: (context, index){
          return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 7,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(ordersList[index].order[index]['name'], style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w600),),
                      ), 
                      GestureDetector(
                        onTap: (){
                          currentQrIndex = index;
                          showFlexibleBottomSheet(
                               minHeight: 0,
                                initHeight: 0.9,
                                maxHeight: 0.9,
                                context: context,
                                builder: _buildBottomSheet,
                                anchors: [0, 0.9],
                                isSafeArea: true,
                              );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Icon(Icons.qr_code),
                        ),
                      )]),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(ordersList[index].order[index]['volume'], style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(ordersList[index].order[index]['price'], style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                    )
                  ]),
                ),
              );
            }),
        );
  }
}