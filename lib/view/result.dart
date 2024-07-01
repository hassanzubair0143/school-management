import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:myschoolmanagement/view/result_details.dart';
import '../model/result_report.dart';
import '../model/send_enquiry.dart';
import '../model/student_result.dart';
import 'Api_Function_Class.dart';
import 'Result_Massege.dart';

class Student_Result extends StatefulWidget {
  final List<Result> getresultdata;
  final String studentid;
  final String schoolid;
  final String standadid;

  const Student_Result({
    super.key,
    required this.getresultdata,
    required this.studentid,
    required this.schoolid,
    required this. standadid,
  });

  @override
  State<Student_Result> createState() => _Student_ResultState();
}

class _Student_ResultState extends State<Student_Result> {
  void Result_Report_Details(String examId, String subject) async {
    try {
      Response response = await post(
          Uri.parse(
              'http://schoolportal.mtemporary.hol.es/index.php/api/get_result_report'),
          body: {
            'exam_id': examId,
            "student_id": "${widget.studentid}",
          });

      String data = response.body;
      print('Response data: $data');
      ResultReport reportdata =
          ResultReport.fromJson(jsonDecode(response.body));

      var jsonData = jsonDecode(data);
      if (jsonData['responce'].toString() == "true") {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Reault_Details(
                  getdetails: reportdata.data, StudentSubject: subject)),
        );
        print(jsonDecode(data).toString());
      } else {
        _showSnackBar('Login failed!');
        print("Error");
        print("Error in response: $jsonData");
      }
    } catch (e) {
      _showSnackBar('Login failed!');
      print(e.toString());
      print('Exception: $e');
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:
          FloatingActionButton(child: Icon(Icons.mail), onPressed: () {
            EnquiryService.resultEnquiry(widget.schoolid, widget.studentid, context);
          }),
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue.shade900,
        title: Text(
          'Result',
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          OptionMenu(studentId: widget.studentid,schoolid:widget.schoolid, standadid:widget.standadid, ),
        ],
      ),

      body: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
        child: ListView.builder(
          itemCount: widget.getresultdata.length,
          itemBuilder: (context, index) {
            Result result = widget.getresultdata[index];
            return Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 70,
                    width: 340,
                    decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(20)),
                    child: InkWell(
                      onTap: () {
                        Result_Report_Details(result.examId, result.examTitle);
                      },
                      child: ListTile(
                        title: Text(
                          result.examTitle,
                          style: TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          result.examNote,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
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
class OptionMenu extends StatelessWidget {
  final String studentId;
  final String schoolid;
  final String standadid;

  const OptionMenu({super.key, required this.studentId, required this.schoolid, required this.standadid});
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
    iconColor: Colors.white,
      onSelected: (String result) {
        switch (result) {
          case 'Option 1':
            MyApiService.profile(studentId,schoolid,standadid, context);
            break;
          case 'Option 2':
            MyApiService.attendence(studentId,schoolid,standadid, context,);
            break;
          case 'Option 3':
            MyApiService.Growth(studentId,schoolid,standadid, context,);
            break;
          case 'Option 4':
            MyApiService.result(studentId,schoolid,standadid, context);
            break;
          case 'Option 5':
            MyApiService.news(studentId,schoolid,standadid, context);
            break;
          case 'Option 6':
            MyApiService.noticebord(studentId,schoolid,standadid, context);
            break;
          case 'Option 7':
            MyApiService.teacher(studentId,schoolid,standadid, context);
            break;
          case 'Option 8':
            MyApiService.exam(studentId,schoolid,standadid, context);
            break;
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        const PopupMenuItem<String>(
          value: 'Option 1',
          child: Text('Student Profile'),
        ),
        const PopupMenuItem<String>(
          value: 'Option 2',
          child: Text('Student Attendance'),
        ),
        const PopupMenuItem<String>(
          value: 'Option 3',
          child: Text('Student Holiday'),
        ),
        const PopupMenuItem<String>(
          value: 'Option 4',
          child: Text('Student Result'),
        ),
        const PopupMenuItem<String>(
          value: 'Option 5',
          child: Text('Student News'),
        ),
        const PopupMenuItem<String>(
          value: 'Option 6',
          child: Text('Student Notice'),
        ),
        const PopupMenuItem<String>(
          value: 'Option 7',
          child: Text('Student Teacher'),
        ),
        const PopupMenuItem<String>(
          value: 'Option 8',
          child: Text('Student Exam'),
        ),

      ],
    );
  }
}

class EnquiryService {
  static Future<void> resultEnquiry(String schoolId, String studentId, BuildContext context) async {
    try {
      Response response = await post(
        Uri.parse('http://schoolportal.mtemporary.hol.es/index.php/api/get_enquiry'),
        body: {
          'school_id': schoolId,
          "student_id": studentId,
        },
      );

      String data = response.body;
      print('Response data: $data');
      SendEnquiry reportdata = SendEnquiry.fromJson(jsonDecode(response.body));
      var jsonData = jsonDecode(data);
      if (jsonData['responce'].toString() == "true") {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Result_Massage(
                getenquiy: reportdata.data,
              )),
        );
        print(jsonData.toString());
      } else {
        _showSnackBar(context, 'Enquiry failed!');
        print("Error in response: $jsonData");
      }
    } catch (e) {
      _showSnackBar(context, 'Enquiry failed!');
      print(e.toString());
      print('Exception: $e');
    }
  }

  static void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }
}