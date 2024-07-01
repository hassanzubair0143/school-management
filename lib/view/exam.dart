import 'package:flutter/material.dart';
import 'package:myschoolmanagement/view/result.dart';

import '../model/student_exam.dart';

class Student_Exam extends StatelessWidget {
  final List<Exam> getexamdata;
  final String studentid;
  final String schoolid;
  final String standadid;
  Student_Exam({super.key, required this.getexamdata, required this.studentid,
  required this.schoolid,
  required this. standadid,});
  OptionMenu my=OptionMenu(schoolid: "",standadid: "",studentId: "",);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue.shade900,
        title: Text(
          'Exams',
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          OptionMenu(studentId:studentid,schoolid:schoolid, standadid:standadid, ),
        ],
      ),
      body: Container(
        // decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.cover,image: AssetImage("assets/image/Rectangle.png")),  color: Colors.blue,),

        child: ListView.builder(
          itemCount: getexamdata.length,
          itemBuilder: (context, index) {
            Exam exam = getexamdata[index];
            return Container(
              child: Row(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        padding: EdgeInsets.only(left: 20),
                        decoration:
                            BoxDecoration(border: Border.all(color: Colors.blue.shade900),borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20))),
                        child: Column(
                          children: [
                            Container(
                                decoration:
                                BoxDecoration(border: Border.all(color: Colors.blue.shade900),borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20)),color: Colors.blue.shade900),
                                padding: EdgeInsets.only(left: 20),
                                height: 50,
                                width: 80,
                                child: Row(
                                  children: [Text(exam.examDate.day.toString(),style: TextStyle(color: Colors.white),)],
                                )),
                            Container(
                                height: 50,
                                width: 80,
                                child: Row(
                                  children: [
                                    Text(exam.examDate.month.toString()),
                                    SizedBox(width: 15,),
                                    Text(exam.examDate.year.toString())
                                  ],
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 10,),
                  Container(height: 50,width: 200,
                    child: ListTile(
                      title: Text(exam.examTitle),
                      subtitle: Text(exam.examNote),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
