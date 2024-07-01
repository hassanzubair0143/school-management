import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:myschoolmanagement/view/exam.dart';
import 'package:myschoolmanagement/view/result.dart';
import 'package:myschoolmanagement/view/student_attendence.dart';
import 'package:myschoolmanagement/view/teacher_information.dart';
import 'package:myschoolmanagement/view/user-login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/Student_Attendence.dart';
import '../model/login_student.dart';
import '../model/school_noticeboard.dart';
import '../model/student_event.dart';
import '../model/student_exam.dart';
import '../model/student_holiday.dart';
import '../model/student_profile.dart';
import '../model/student_result.dart';
import '../model/teacher_information.dart';
import 'Api_Function_Class.dart';
import 'Growth.dart';
import 'NewsandEvent.dart';
import 'Profile information.dart';
import 'holiday.dart';

class Student_home extends StatefulWidget {
  final StudentModel listdata;

  Student_home({super.key, required this.listdata});

  @override
  State<Student_home> createState() => _Student_homeState();
}

class _Student_homeState extends State<Student_home> {
  void logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('student');
    await prefs.setBool('isLoggedin', false);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => UserLogin()),
    );
  }
  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        width: 220,
        backgroundColor: Colors.green,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("assets/image/images.jpeg"),
                )),
                child: Text("")),
            ListTile(
              leading: Icon(Icons.home_outlined),
              title:
                  Text('HOME', style: TextStyle(fontWeight: FontWeight.w900)),
              onTap: () {
                // Handle drawer item click
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app_outlined),
              title:
                  Text('Logout', style: TextStyle(fontWeight: FontWeight.w900)),
              onTap: () {
                logout(context);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue.shade900,
        title: Text(
          "Home",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                height: 260,
                width: 400,
                child: Stack(
                  children: [
                    Container(
                      child: Image.asset(
                        "assets/image/Group-1.png",
                        height: 184,
                        width: 400,
                      ),
                    ),
                    Positioned(
                      left: 110,
                      top: 30,
                      child: Container(
                        child: Text(
                          'WelCome Back',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 110,
                      top: 80,
                      child: Container(
                        child: Image.asset("assets/image/Profile.png"),
                      ),
                    ),
                    Positioned(
                      left: 132,
                      top: 100,
                      child: Container(
                        child: Image.asset("assets/image/bx-happy.svg-1.png"),
                      ),
                    ),
                  ],
                ),

                // Container(
                //     height: 800,
                //     child: Image.asset("assets/image/Group-1.png")),
              ),
              Selection(
                image1: "assets/user.png",
                text1: "Profile",
                image2: "assets/Attendance.png",
                text2: "Attendance",
                onTap1: () {
                  MyApiService.profile(widget.listdata.studentId,widget.listdata.schoolId,widget.listdata.studentStandard, context);
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => Profile_Information(),
                  //     ));
                },
                onTap2: () {
                  MyApiService.attendence(widget.listdata.studentId,widget.listdata.schoolId,widget.listdata.studentStandard, context,);
                  // Handle Attendance tap
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => Student_Attendence(studentId: "${widget.listdata.schoolId}",),
                  //     ));
                },
              ),
              SizedBox(height: 30),
              Selection(
                image1: "assets/exam.png",
                text1: "Exam",
                image2: "assets/result.png",
                text2: "Result",
                onTap1: () {
                  MyApiService.exam(widget.listdata.studentId,widget.listdata.schoolId,widget.listdata.studentStandard, context);
                  // Handle Exam tap
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => Profile_Information(),
                  //     ));
                },
                onTap2: () {
                 MyApiService.result(widget.listdata.studentId,widget.listdata.schoolId,widget.listdata.studentStandard, context);
                  // Handle Result tap
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => Profile_Information(),
                  //     ));
                },
              ),
              SizedBox(height: 30),
              Selection(
                image1: "assets/teacher.png",
                text1: "Teacher",
                image2: "assets/growth.png",
                text2: "Growth",
                onTap1: () {
                 MyApiService.teacher(widget.listdata.studentId,widget.listdata.schoolId,widget.listdata.studentStandard,context);
                  // Handle Teacher tap
                },
                onTap2: () {
                 MyApiService.Growth(widget.listdata.studentId,widget.listdata.schoolId,widget.listdata.studentStandard,context,);
                  // Handle Growth tap
                },
              ),
              SizedBox(height: 30),
              Selection(
                image1: "assets/holiday.png",
                text1: "Holiday",
                image2: "assets/newspaper.png",
                text2: "News & Event",
                onTap1: () {
                  MyApiService.news(widget.listdata.studentId,widget.listdata.schoolId,widget.listdata.studentStandard,context);
                  // Handle Holiday tap
                },
                onTap2: () {
                  MyApiService.noticebord(widget.listdata.studentId,widget.listdata.schoolId,widget.listdata.studentStandard,context);
                  // Handle News & Event tap
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Selection extends StatelessWidget {
  final String image1;
  final String text1;
  final String image2;
  final String text2;
  final VoidCallback onTap1;
  final VoidCallback onTap2;

  const Selection({
    Key? key,
    required this.image1,
    required this.text1,
    required this.image2,
    required this.text2,
    required this.onTap1,
    required this.onTap2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                InkWell(
                  onTap: onTap1,
                  child: Container(
                    height: 110,
                    width: 110,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.greenAccent,
                    ),
                    child: Image.asset(image1),
                  ),
                ),
                const SizedBox(height: 7),
                Text(text1),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                InkWell(
                  onTap: onTap2,
                  child: Container(
                    height: 110,
                    width: 110,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.greenAccent,
                    ),
                    child: Image.asset(image2),
                  ),
                ),
                const SizedBox(height: 7),
                Text(text2),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
// class MyApiService {
//   static Future<void> profile(String studentId ,String schoolId ,String studentStandard ,BuildContext context) async {
//     try {
//       Response response = await post(
//           Uri.parse(
//               'http://schoolportal.mtemporary.hol.es/index.php/api/get_student_profile'),
//           body: {
//             'student_id': studentId,
//           });
//
//       String data = response.body;
//       StudentProfile profiledata =
//       StudentProfile.fromJson(jsonDecode(response.body));
//
//       if (jsonDecode(data)['responce'].toString() == "true") {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//               builder: (context) =>
//                   Profile_Information(getprofile: profiledata.data,studentid: studentId,
//                     schoolid:schoolId,
//                     standadid:studentStandard,)),
//         );
//         print(jsonDecode(data).toString());
//       } else {
//
//         print("Error");
//       }
//     } catch (e) {
//
//       print(e.toString());
//     }
//   }
//
// }