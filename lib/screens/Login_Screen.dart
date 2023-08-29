import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:frd/screens/home_screen.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  final emailController=TextEditingController();
  final passwordController=TextEditingController();
  final ageController=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Sign up'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal:15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              TextFormField(
                decoration: InputDecoration(
                  hintText: 'email'
                ),
              ),
    SizedBox(height:20),
              TextFormField(
                decoration: InputDecoration(
                    hintText: 'password'
                ),
              ),
              SizedBox(height:20),
              TextFormField(
                  controller: ageController,
                  keyboardType:TextInputType.number,
                decoration: InputDecoration(
                hintText:'age'
                ),
              ),

              SizedBox(height:20),
              InkWell(
                onTap: ()async {
                  SharedPreferences sp = await SharedPreferences.getInstance();
                  sp.setString('email', emailController.text.toString());
                  sp.setString('age', ageController.text.toString());
                  sp.setString('userType', 'teacher');
                  sp.setBool('isLogin', true);


                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  },

                  child:
                  Container(
                      height: 50,
                      width: double.infinity,
                      color: Colors.yellowAccent,
                      child: Center(
                        child: Text('Sign up',),
                      )
    ) ,
    ),
    ]

    ),
              ),


    );
  }
}
