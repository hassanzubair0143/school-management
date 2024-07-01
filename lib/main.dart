import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:myschoolmanagement/view/student_home_screen.dart';
import 'package:myschoolmanagement/view/user-login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'model/login_student.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(debugShowCheckedModeBanner: false,
    home: Scaffold(
      body: MyHomePage (),
    ),
  ));
}

                            //Shareprefrence
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
        future: checkLoginStatus(),
        builder: (context, snapshot) {


          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.data == true) {



            return FutureBuilder<StudentModel?>(
              future: getStoredUser(),
              builder: (context, snapshot) {


                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasData) {
                  return Student_home(listdata: snapshot.data!);
                } else {
                  return UserLogin();
                }
              },
            );
          } else {
            return UserLogin();
          }
        },
      ),
    );
  }

  Future<bool> checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }

  Future<StudentModel?> getStoredUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = prefs.getString('student');
    if (userJson != null) {
      return StudentModel.fromJson(jsonDecode(userJson));
    }
    return null;
  }
}






                                                         //Splash Screen



class MyHomePage extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}
class SplashScreenState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) => MyApp()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(

          child:Image.asset("assets/image/Rectangle.png")
      ),
    );
  }
}
