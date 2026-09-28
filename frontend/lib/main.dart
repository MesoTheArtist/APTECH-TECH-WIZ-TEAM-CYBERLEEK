import 'package:flutter/material.dart';
import 'package:frontend/pages/dasboard.dart';
import './pages/home.dart';
import './pages/register.dart';
import './pages/login.dart';
import './pages/dasboard.dart';
import './pages/transaction.dart';

void main(){
  runApp( const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      initialRoute: '/',

      routes: {
        // '/' : (context) => Home(),
        // '/register' : (context) => Register(),
        // '/login' : (context) => Login()

        '/' : (context) => Dashboard(),
        '/transactions' : (context) => Transactions()
      },
    );
  }
}
