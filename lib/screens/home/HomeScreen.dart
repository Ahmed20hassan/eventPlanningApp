import 'package:flutter/material.dart';
import 'package:todo/screens/creat_event.dart';
import 'package:todo/screens/home/taps/home_tap/home_tap.dart';
import 'package:todo/screens/home/taps/love_tap.dart';
import 'package:todo/screens/home/taps/map_tap.dart';
import 'package:todo/screens/home/taps/proflie_tap.dart';

class Homescreen extends StatefulWidget {
  static const String routName='HomeScreen';
   Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
int currentindex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context, CreatEvent.routName);
        },
      child: Icon(Icons.add,
      color: Colors.white,),),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index){
            currentindex=index;
            setState(() {

            });
          },
          items: [
        BottomNavigationBarItem(icon: Icon(Icons.home),label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.map),label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.heart_broken),label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.person),label: ''),
      ]),
    body: taps[currentindex],
    );
  }

  List taps=[
    HomeTap(),
    MapTap(),
    LoveTap(),
    ProflieTap(),
  ];
}
