import 'dart:convert';

import 'package:http/http.dart';
import 'package:myschoolmanagement/view/result.dart';
import 'package:myschoolmanagement/view/student_attendence.dart';
import 'package:myschoolmanagement/view/teacher_information.dart';

import '../model/Student_Attendence.dart';
import '../model/school_noticeboard.dart';
import '../model/student_event.dart';
import '../model/student_exam.dart';
import '../model/student_holiday.dart';
import '../model/student_profile.dart';
import 'package:flutter/material.dart';

import '../model/student_result.dart';
import '../model/teacher_information.dart';
import 'Growth.dart';
import 'NewsandEvent.dart';
import 'Profile information.dart';
import 'exam.dart';
import 'holiday.dart';

class MyApiService {
  static Future<void> profile(String studentId, String schoolId,
      String studentStandard, BuildContext context) async {
    try {
      Response response = await post(
          Uri.parse(
              'http://schoolportal.mtemporary.hol.es/index.php/api/get_student_profile'),
          body: {
            'student_id': studentId,
          });

      String data = response.body;
      StudentProfile profiledata =
          StudentProfile.fromJson(jsonDecode(response.body));

      if (jsonDecode(data)['responce'].toString() == "true") {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Profile_Information(
                    getprofile: profiledata.data,
                    studentid: studentId,
                    schoolid: schoolId,
                    standadid: studentStandard,
                  )),
        );
        print(jsonDecode(data).toString());
      } else {
        print("Error");
      }
    } catch (e) {
      print("Server Error");
      print(e.toString());
    }
  }

  static Future<void> teacher(String studentId, String schoolId,
      String studentStandard, BuildContext context) async {
    try {
      Response response = await post(
          Uri.parse(
              'http://schoolportal.mtemporary.hol.es/index.php/api/get_school_teacher'),
          body: {
            'school_id': schoolId,
          });

      String data = response.body;
      TeacherInformation teacherdata =
          TeacherInformation.fromJson(jsonDecode(response.body));

      if (jsonDecode(data)['responce'].toString() == "true") {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Teachers(
                    getteacherdata: teacherdata.data,
                    studentid: studentId,
                    schoolid: schoolId,
                    standadid: studentStandard,
                  )),
        );
        print(jsonDecode(data).toString());
      } else {
        print("Error");
      }
    } catch (e) {
      print("Server Error");
      print(e.toString());
    }
  }

  static Future<void> exam(String studentId, String schoolId,
      String studentStandard, BuildContext context) async {
    try {
      Response response = await post(
          Uri.parse(
              'http://schoolportal.mtemporary.hol.es/index.php/api/get_exams'),
          body: {
            'standard_id': studentStandard,
            'school_id': schoolId,
          });

      String data = response.body;
      StudentExam attendencedata =
          StudentExam.fromJson(jsonDecode(response.body));
      if (jsonDecode(data)['responce'].toString() == "true") {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Student_Exam(
                    getexamdata: attendencedata.data,
                    studentid: studentId,
                    schoolid: schoolId,
                    standadid: studentStandard,
                  )),
        );
        print(jsonDecode(data).toString());
      } else {
        print("Error");
      }
    } catch (e) {
      print("Server Error");
      print(e.toString());
    }
  }
  static Future<void> attendence(String studentId, String schoolId,
      String studentStandard, BuildContext context,) async {
    try {
      String year = DateTime.now().year.toString();
      String month = DateTime.now().month.toString();
      Response response = await post(
        Uri.parse(
            'http://schoolportal.mtemporary.hol.es/index.php/api/get_student_attendence'),
        body: {
          'student_id': studentId,
          'year': year.toString(),
          'month': month.toString(),
        },
       );

      String data = response.body;
      StudentAttandance attendencedata =
      StudentAttandance.fromJson(jsonDecode(data));

      if (attendencedata.responce) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Student_Attendence(
              getattendencedata: attendencedata.data,
              studentid: studentId,
              schoolid: schoolId,
              standadid: studentStandard,
            ),
          ),
        );
        print(data);
      } else {
        print("Error");
      }
    } catch (e) {
      print("Server Error");
      print(e.toString());
    }
  }


  static Future<void> result(String studentId, String schoolId,
      String studentStandard, BuildContext context) async {
    try {
      Response response = await post(
          Uri.parse(
              'http://schoolportal.mtemporary.hol.es/index.php/api/get_results'),
          body: {
            'standard_id': studentStandard?.toString() ?? '',
            'school_id': schoolId?.toString() ?? '',
          });

      String data = response.body;
      Map<String, dynamic> jsonResponse = jsonDecode(data);
      StudentResult atresultdata = StudentResult.fromJson(jsonResponse);

      if (jsonResponse['responce'].toString() == "true") {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Student_Result(
                    getresultdata: atresultdata.data,
                    studentid: studentId,
                    schoolid: schoolId,
                    standadid: studentStandard,
                  )),
        );

        print(jsonResponse.toString());
      } else {
        print("Error");
      }
    } catch (e) {
      print("Server Error");
      print(e.toString());
    }
  }

  static Future<void> news(String studentId, String schoolId,
      String studentStandard, BuildContext context) async {
    try {
      Response response = await post(
          Uri.parse(
              'http://schoolportal.mtemporary.hol.es/index.php/api/get_school_event'),
          body: {
            'school_id': schoolId,
          });

      String data = response.body;
      StudentEvent getnews = StudentEvent.fromJson(jsonDecode(response.body));

      if (jsonDecode(data)['responce'].toString() == "true") {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Holiday(
                    getnewsandeventdata: getnews.data,
                    studentid: studentId,
                    schoolid: schoolId,
                    standadid: studentStandard,
                  )),
        );
        print(jsonDecode(data).toString());
      } else {
        print("Error");
      }
    } catch (e) {
      print("Server Error");
      print(e.toString());
    }
  }

  static Future<void> noticebord(String studentId, String schoolId,
      String studentStandard, BuildContext context) async {
    try {
      Response response = await post(
          Uri.parse(
              'http://schoolportal.mtemporary.hol.es/index.php/api/get_school_noticeboard'),
          body: {
            'school_id': schoolId,
          });

      String data = response.body;
      SchoolNoticeboard getnews =
          SchoolNoticeboard.fromJson(jsonDecode(response.body));

      if (jsonDecode(data)['responce'].toString() == "true") {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => News_Event(
                    getnoticedata: getnews.data,
                    studentid: studentId,
                    schoolid: schoolId,
                    standadid: studentStandard,
                  )),
        );
        print(jsonDecode(data).toString());
      } else {
        print("Error");
      }
    } catch (e) {
      print("Server Error");
      print(e.toString());
    }
  }

  static Future<void> Growth(String studentId, String schoolId,
      String studentStandard, BuildContext context,) async {
    try {
      String year = DateTime.now().year.toString();
      String month = DateTime.now().month.toString();
      Response response = await post(
        Uri.parse(
            'http://schoolportal.mtemporary.hol.es/index.php/api/get_holidays'),
        body: {
          'school_id': schoolId,
          "year": year,
          "month": month,
        },
      );

      String data = response.body;
      StudentHoliday attendencedata = StudentHoliday.fromJson(jsonDecode(data));

      if (jsonDecode(data)['responce'].toString() == "true") {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Student_Growth(
              getgrowthdata: attendencedata.data,
              studentid: studentId,
              schoolid: schoolId,
              standadid: studentStandard,
            ),
          ),
        );
        print(data);
      } else {
        print("Error");
      }
    } catch (e) {
      print("Server Error");
      print(e.toString());
    }
  }
}
