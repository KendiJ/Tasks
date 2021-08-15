import 'package:flutter/material.dart';
import 'package:my_tasks/Pages/landing_page.dart';
import 'package:firebase_core/firebase_core.dart';


void main()async{
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(HomePage());
}
  

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        backgroundColor: Colors.white
      ),
      home: LandingPage(),
    );  
  }

}
