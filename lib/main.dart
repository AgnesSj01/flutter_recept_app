import 'package:flutter/material.dart';
import 'package:flutter_projekt/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) 
  {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //Tar bort debug text
      title: 'Cocktails',
       home: Home(),//Skapat home-sida
     
    );
  }
}



