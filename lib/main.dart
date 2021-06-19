 //@dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:peliculas/src/pages/home_pages.dart';
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: '/',
      routes: {
        '/':(BuildContext context)=>HomePage(),
      },
    );
  }
}