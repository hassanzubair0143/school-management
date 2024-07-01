import 'package:flutter/material.dart';
import 'package:myschoolmanagement/view/result.dart';
import 'package:myschoolmanagement/view/student_home_screen.dart';

import '../model/student_profile.dart';

class Profile_Information extends StatelessWidget {
  final Porofile_Model getprofile;
  final String studentid;
  final String schoolid;
  final String standadid;

  Profile_Information({super.key, required this.getprofile
    , required this.studentid,
    required this.schoolid,
    required this. standadid,});

  OptionMenu my=OptionMenu(schoolid: "",standadid: "",studentId: "",);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: Colors.blue.shade900,
          title: Text('Profile',style: TextStyle(color: Colors.white),),
          actions: <Widget>[
            OptionMenu(studentId:studentid,schoolid:schoolid, standadid:standadid, ),
          ],
        ),
        body: Container(
            child: Column(
              children: [
                Container(
                  height: 150,
                  width: double.infinity,
                  color: Colors.greenAccent,
                  child: Column(
                    children: [
                      // Row(
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   children: [
                      //     IconButton(
                      //       onPressed: () {
                      //         // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Student_home(),));
                      //       },
                      //       icon: Icon(Icons.arrow_back,color: Colors.white,),
                      //       style: ButtonStyle(
                      //           backgroundColor:
                      //           MaterialStatePropertyAll(Colors.blue.shade900)),
                      //     ),
                      //   ],
                      // ),
                      Container(
                        margin:EdgeInsets.only(top: 30),
                        child: Image.asset(
                          "assets/image/Rectangle.png",
                          height: 90,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  height: 40,
                  width: double.infinity,
                  color: Colors.blue.shade900,
                  child: Center(
                      child: Text(
                        "Bio Data",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )),
                ),
                SizedBox(height: 20,),
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    children: [
                      BioData("Full Name", "${getprofile.studentName}"),
                      SizedBox(height: 10,),
                      BioData("Birth Date", "${getprofile.studentBirthdate}"),
                      SizedBox(height: 10,),
                      BioData("Roll Number", "${getprofile.studentRollNo}"),
                      SizedBox(height: 10,),
                      BioData("Standard", "${getprofile.studentStandard}"),
                      SizedBox(height: 10,),
                      BioData("Semester", "${getprofile.studentSemester}"),
                      SizedBox(height: 10,),
                      BioData("Branch", "${getprofile.studentBranch}"),
                      SizedBox(height: 10,),
                      BioData("Batch", "${getprofile.studentBatch}"),
                      SizedBox(height: 10,),
                      BioData("Division", "${getprofile.studentDivision}"),

                    ],
                  ),
                ),
                SizedBox(height: 25,),
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  height: 40,
                  width: double.infinity,
                  color: Colors.blue.shade900,
                  child: Center(
                      child: Text(
                        "Contact Details",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )),
                ),
                SizedBox(height: 20,),
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    children: [
                      BioData("Address", "${getprofile.studentAddress}"),
                      SizedBox(height: 10,),
                      BioData("City", "${getprofile.studentCity}"),
                      SizedBox(height: 10,),
                      BioData("Parent  Contact", "${getprofile.studentParentPhone}"),


                    ],
                  ),
                ),
              ],
            )));
  }

  Widget BioData(key1, value1) {
    return Row(

      children: [
        Expanded(child: Text(key1)),
        Expanded(child: Text(value1))
      ],
    );

  }
}
