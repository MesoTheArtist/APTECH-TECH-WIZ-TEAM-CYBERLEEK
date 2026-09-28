import 'package:flutter/material.dart';
import 'package:frontend/pages/dasboard.dart';
import './pages/home.dart';
import './pages/about.dart';
import './pages/register.dart';
import './pages/login.dart';

// dasboard
import './pages/dasboard.dart';
import './pages/transaction.dart';
import './pages/contact_feedback.dart';
import './pages/mybudget.dart';
import './pages/savinggoals.dart';

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
        // '/about' : (context) => About(),
        // '/register' : (context) => Register(),
        // '/login' : (context) => Login()

        // dasboard
        '/' : (context) => Dashboard(),
        '/transactions' : (context) => Transactions(),
        '/contact_feedback' : (context) => ContactFeedback(),
        '/mybudget' : (context) => MyBudgets(),
        '/savings_goals' : (context) => SavingsGoals()
      },
    );
  }
}
