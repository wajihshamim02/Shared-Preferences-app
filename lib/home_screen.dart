// import 'dart:html';

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_prefrences_app/login_screen.dart';
import 'package:shared_prefrences_app/screen2.dart';
import 'package:shared_prefrences_app/student_screen.dart';
import 'package:shared_prefrences_app/teacher_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    islogin();
  }

  void islogin() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool islogin = sp.getBool('Login') ?? false;
    String usertype = sp.getString('usertype') ?? '';

    if (islogin) {
      if (usertype == 'student') {
        Timer(Duration(seconds: 5), () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => StudentScreen()));
        });
      } else if(usertype == 'teacher') {  
        Timer(Duration(seconds: 5), () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => TeacherScreen()));
        });
      }
    }
    else {
        Timer(Duration(seconds: 5), () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Screen2()));
        });
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image(
        image: NetworkImage(
            'https://cdn.pixabay.com/photo/2017/01/22/19/12/pizza-2000602_960_720.jpg'),
        fit: BoxFit.fill,
        height: double.infinity,
      ),
    );
  }
}
