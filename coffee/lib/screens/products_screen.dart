import 'dart:async';
import 'package:coffee/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:property_change_notifier/property_change_notifier.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {

  _getSvg(){
    final String assetName = 'assets/images/frame_397.svg';
    final Widget svg = SvgPicture.asset(
    assetName,
    semanticsLabel: 'Acme Logo'
    );
  return svg;
  }
  IconData themeIcon = Icons.sunny;
  bool _isThemeLight = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //header
      body: SafeArea(
        child: Column(
          children: [
            Column(
              children: [
                const SizedBox(height: 20,),
                Row(
                  children: [Image.asset('assets/images/color_black.png', width: 70,), 
                  const Column(
                    children: [
                    Text('Coffee shop adress', style: TextStyle(fontSize: 16, color: Colors.grey),), 
                    Row(children: [Icon(Icons.map), Text('43, Marathon st.', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),)],),],
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: (){
                      _isThemeLight = !_isThemeLight;
                      if(_isThemeLight){
                        themeIcon = Icons.sunny;
                        model.theme = ThemeData.light();
                      } else{
                        themeIcon = Icons.dark_mode;
                        model.theme = ThemeData.dark();
                      }
                      setState(() {
                        MyApp();
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Icon(themeIcon, size: 35,),
                    ),
                  )]
                ),
                const SizedBox(height: 25,),
                Container(
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                const SizedBox(width: 15,),
                Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), gradient: const LinearGradient(
          begin: Alignment.topLeft,
          colors: [Color.fromARGB(255, 255, 200, 163), Color.fromARGB(255, 255, 189, 230)]),),
                  width: 350, height:250,
                  child: Row(
                    children: [
                    _getSvg(),
                  ],),),
                  const SizedBox(width: 15,),
                  Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), gradient: const LinearGradient(
          begin: Alignment.topLeft,
          colors: [Color.fromARGB(255, 255, 200, 163), Color.fromARGB(255, 255, 189, 230)]),),
                  width: 350, height:250,
                  child: Row(
                    children: [
                    _getSvg(),
                  ],),)
              ],
            ),
          ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [GestureDetector(
                      onTap: (){
                      },
                      child: Container(
                        decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10)),
                        child: const Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Text('Coffee', style: TextStyle( fontSize: 16),),
                        )),
                    ), GestureDetector(
                                  onTap: (){
                      },
                      child: Container(
                        decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10)),
                        child: const Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Text('Tea', style: TextStyle(fontSize: 16),),
                        )),
                    ), GestureDetector(
                                  onTap: (){
                      },
                      child: Container(
                        decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10)),
                        child: const Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Text('Drinks', style: TextStyle( fontSize: 16),),
                        )),
                    ), GestureDetector(
                                  onTap: (){
                      },
                      child: Container(
                        decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10)),
                        child: const Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Text('Desserts', style: TextStyle( fontSize: 16),),
                        )),
                    ),
                  ]),
                ),
              ],
            ),
          
            Expanded(child: ListView(
              children: const [
                  ProductWidget(),
                  ProductWidget(),
                  ProductWidget(),
                  ProductWidget(),
                  ProductWidget(),
                  ProductWidget(),
                  ProductWidget(),
              ],
            ))
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
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
      ProductWidgetTile(),
      ProductWidgetTile()
    ],);
  }
}

Widget _buildBottomSheet(
    BuildContext context,
    ScrollController scrollController,
    double bottomSheetOffset,
  ) {
    return Material(
        child: Container(
          child: ListView(
            controller: scrollController,
            children:  [
              Padding(
                padding: EdgeInsets.only(top: 20, left: 15, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_back_ios)),
                  // Text('Espresso-based coffee with the addition of warmed foamed milk'),
                  const Text('Флэт Уайт', style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),),
                  GestureDetector(
                    onTap:(){
                      Fluttertoast.showToast(
                    msg: "Flat White",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Color.fromARGB(255, 141, 141, 141),
                    textColor: Colors.white,
                    fontSize: 16.0);
                    },
                    child: const Icon(Icons.info_outline))
                ],),
              ),
              Image.asset('assets/images/флэт_уайт.png', scale: 0.4,),
              const Text('Espresso-based coffee with the addition of warmed foamed milk', textAlign: TextAlign.center, style: TextStyle(fontSize: 16),),
              const SizedBox(height: 10,),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Volume', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),),
              ),
              Text('Ермолюгин Никита Сергеевич'),
              const SizedBox(height: 12,),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: GestureDetector(
                  onTap: (){
                    Fluttertoast.showToast(
                    msg: "Добавлено в корзину",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Color.fromARGB(255, 141, 141, 141),
                    textColor: Colors.white,
                    fontSize: 16.0);
                  },
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), 
                    color: const Color.fromARGB(255, 235, 75, 27)), 
                    child: const Center(child: Text('Add to card 120 \$', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w500),)),),
                ),
              )
            ],
          ),
        ),
      );
  }

class ProductWidgetTile extends StatelessWidget {
  final String imageLink = '';

  const ProductWidgetTile({
    super.key,

  });

_getMaxHeith()
{
  return double.infinity;
}
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
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
        padding: const EdgeInsets.all(4.0),
        child: Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.only(left: 24, right: 24, bottom: 10),
            child: Column(
              children: [
                Image.asset('assets/images/флэт_уайт.png', width: 120, ),
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
      ),
    );
  }
}

class ThemeModel extends PropertyChangeNotifier<String> {
  ThemeData _theme = ThemeData.light();

  ThemeData get theme => _theme;

  set theme(ThemeData value) {
    _theme = value;
    notifyListeners('theme');
  }
}