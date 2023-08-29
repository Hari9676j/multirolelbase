 import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Login_Screen.dart';

class HomeScreen extends StatefulWidget {
 const HomeScreen({super.key});
   @override
   State<HomeScreen> createState() => _HomeScreenState();
 }

 class _HomeScreenState extends State<HomeScreen> {

 String email='',age='';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData()async{
    SharedPreferences sp= await SharedPreferences.getInstance();
    email=sp.getString('email')?? '';
    age=sp.getString('age')?? '';
    setState(() {
      
    });
  }


   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: Text('Home'),
         automaticallyImplyLeading: false,
       ),
       body: Padding(
         padding: const EdgeInsets.all(30.0),
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [
          Text('HOME SCREEN'),
           SizedBox(height:20),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Text('Email'),
               Text(email.toString()),
             ],
           ),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text('age'),
                 Text(age.toString()),
               ],
             ),
           SizedBox(height:40,),
           InkWell(
           onTap: ()async{
         SharedPreferences sp = await SharedPreferences.getInstance();
         sp.clear();


         Navigator.push(context,
             MaterialPageRoute(builder: (context) => LoginScreen()));
     },
     child: Container(
     height:50,
     width:double.infinity,
     color:Colors.yellowAccent,
     child:Center(
     child: Text('Logout',),
     )
     ),
     )


           ],
           ),
       ),
     );
   }
}
