// import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_prefrences_app/home_screen.dart';
import 'package:shared_prefrences_app/screen2.dart';
import 'package:shared_prefrences_app/student_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formdate = GlobalKey<FormState>();
  final textemailcontroller = TextEditingController();
  final textpasswordcontroller = TextEditingController();
  final textagecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sign up',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 80,
              ),
              Text(
                'Shared Prefrences',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: textemailcontroller,
                decoration: InputDecoration(hintText: 'Email'),
              ),
              SizedBox(
                height: 12,
              ),
              TextFormField(
                controller: textpasswordcontroller,
                decoration: InputDecoration(hintText: 'Password'),
              ),
              SizedBox(
                height: 12,
              ),
              TextFormField(
                controller: textagecontroller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: 'Age'),
              ),
              SizedBox(
                height: 12,
              ),
              InkWell(
                onTap: () async {
                  // SharedPreferences sp = await SharedPreferences.getInstance();

                  // sp.setString('name', 'Wajih');
                  // sp.setInt('age', 22);
                  //  sp.setBool('Login', false);

                  // print(sp.getString('name'));
                  // print(sp.getInt('age'));
                  // print(sp.getBool('Login'));

                  // sp.remove('name');

                  SharedPreferences sp = await SharedPreferences.getInstance();
                  sp.setString('email', textemailcontroller.text.toString());
                  sp.setString(
                      'Password', textpasswordcontroller.text.toString());
                  sp.setString('age', textagecontroller.text.toString());
                  sp.setBool('Login', true);

                  sp.setString('usertype', 'teacher');

                  if (sp.getString('usertype') == 'teacher') {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => StudentScreen()));
                  } 
                  else if (sp.getString('usertype') == 'student') {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => StudentScreen()));
                  }
                   else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => StudentScreen()));
                  }
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  color: Colors.red,
                  child: Center(
                    child: Text(
                      'Sign up',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
