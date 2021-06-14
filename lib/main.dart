import 'package:flutter/material.dart';
import 'package:simpay_flutter/views/homepage.dart';

 void main(){
   runApp(MyApp());

 }
 class MyApp extends StatelessWidget {
 
   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       title: "Payment Gateway",
       theme: ThemeData(
         primarySwatch: Colors.blue,
         visualDensity: VisualDensity.adaptivePlatformDensity,
       ),
       home: Home(),
     );
   }
 }
 