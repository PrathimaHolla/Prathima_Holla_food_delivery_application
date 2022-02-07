// @dart=2.9
import 'package:flutter/material.dart';
import 'package:fooddeliveryapplication/screens/oders_screen/adding_new_item.dart';
import 'screens/reg_screens/cust_reg.dart';
import 'screens/reg_screens/main_reg.dart';
import 'screens/reg_screens/rest_reg.dart';
void main() {
  runApp(myApp());
}

class myApp extends StatefulWidget {
  // const myApp({ Key? key }) : super(key: key);

  @override
  _myAppState createState() => _myAppState();
}

class _myAppState extends State<myApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/registerRest':(context)=>restReg(),
        '/':(context)=>mainRegister(),
        '/registerUser':(context)=>custReg(),
        '/addingItem':(context)=>adding_item(), 
      },
    );
  }
}