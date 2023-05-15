import 'package:flutter/material.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
List<dynamic> activeTile = [Colors.white, Colors.white, Colors.white, Colors.white];

_setActiveTile(int index){
    activeTile.forEach((element) {
      element = Colors.white;
    });
    activeTile[index] = Colors.black;
    setState(() {
      debugPrint('ffff');
    });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //header
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [GestureDetector(
                onTap: (){
                  _setActiveTile(0);
                },
                child: Container(
                  decoration: BoxDecoration(color: activeTile[0],
                  borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text('Coffee', style: TextStyle(backgroundColor: activeTile[0], fontSize: 16),),
                  )),
              ), GestureDetector(
                            onTap: (){
                  _setActiveTile(1);
                },
                child: Container(
                  decoration: BoxDecoration(color: activeTile[1],
                  borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text('Tea', style: TextStyle(backgroundColor: activeTile[1], fontSize: 16),),
                  )),
              ), GestureDetector(
                            onTap: (){
                  _setActiveTile(2);
                },
                child: Container(
                  decoration: BoxDecoration(color: activeTile[2],
                  borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text('Drinks', style: TextStyle(backgroundColor: activeTile[2], fontSize: 16),),
                  )),
              ), GestureDetector(
                            onTap: (){
                  _setActiveTile(3);
                },
                child: Container(
                  decoration: BoxDecoration(color: activeTile[3],
                  borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text('Desserts', style: TextStyle(backgroundColor: activeTile[3], fontSize: 16),),
                  )),
              ),
            ]),
            ProductWidget()
          ],
        ),
      ),
    );
  }
}

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Card(
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.only(left: 24, right: 24),
          child: Column(
            children: [
              Image.asset('assets/images/флэт_уайт.png', width: 100,),
              Text('Флэт Уайт', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
              Text('from 180 \$'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(border: Border.all(color: Color.fromARGB(255, 235, 75, 27),), borderRadius: BorderRadius.circular(10)),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 18, right: 18, top: 4, bottom: 4),
                    child: Text('Select', style: TextStyle(color: Color.fromARGB(255, 235, 75, 27)),),
                  ),
                ),
              )
            ],
          ),
        )
      ),
      SizedBox(width: 10,),
      Card(
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.only(left: 24, right: 24),
          child: Column(
            children: [
              Image.asset('assets/images/флэт_уайт.png', width: 100,),
              Text('Флэт Уайт', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
              Text('from 180 \$'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(border: Border.all(color: Color.fromARGB(255, 235, 75, 27),), borderRadius: BorderRadius.circular(10)),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 18, right: 18, top: 4, bottom: 4),
                    child: Text('Select', style: TextStyle(color: Color.fromARGB(255, 235, 75, 27)),),
                  ),
                ),
              )
            ],
          ),
        )
      ),
    ],);
  }
}