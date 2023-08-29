import 'dart:async';

import 'package:flutter/material.dart';
import 'package:frd/screens/Login_Screen.dart';
import 'package:frd/screens/home_screen.dart';
import 'package:frd/screens/student_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
 
 
  @override
  void initState(){
    //TODO:implement initState
    super.initState();


    isLogin();
  }
 void isLogin()async {
   SharedPreferences sp = await SharedPreferences.getInstance();
   bool? isLogin = sp.getBool('isLogin') ?? false;
   String userType = sp.getString('userType') ?? '';
   if (isLogin) {

     if(userType =='student'){
       Timer(Duration(seconds: 3), () {
         Navigator.push(context,
             MaterialPageRoute(builder: (context) =>StudentScreen()));
       });
   } else {
     Timer(Duration(seconds: 3), () {
       Navigator.push(context,
           MaterialPageRoute(builder: (context) => HomeScreen()));
     });
     Timer(Duration(seconds: 3), () {
       Navigator.push(context,
           MaterialPageRoute(builder: (context) => HomeScreen()));
     });
   }
   } else {
     Timer(Duration(seconds: 3), () {
       Navigator.push(context,
           MaterialPageRoute(builder: (context) => LoginScreen()));
     });
   }
 }
 
 
 
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
       body:
       Image(
           height:double.infinity,
           fit: BoxFit.fitHeight,
           image: NetworkImage('https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60')),
    );
  }
}
