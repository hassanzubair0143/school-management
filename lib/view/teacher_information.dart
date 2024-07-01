import 'package:flutter/material.dart';
import 'package:myschoolmanagement/view/result.dart';
import '../model/teacher_information.dart';

class Teachers extends StatelessWidget {
  final List<TeacherModel> getteacherdata;
  final String studentid;
  final String schoolid;
  final String standadid;
  Teachers({required this.getteacherdata,required this.studentid,
    required this.schoolid,
    required this. standadid,});
  OptionMenu my=OptionMenu(schoolid: "",standadid: "",studentId: "",);
  // void _resultEnquiry(BuildContext context) {
  //   EnquiryService.resultEnquiry(schoolid, studentid, context);
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:
      FloatingActionButton(child: Icon(Icons.mail), onPressed: () {
        EnquiryService.resultEnquiry(schoolid, studentid, context);
      }),
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue.shade900,
        title: Text('Teachers',style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          OptionMenu(studentId:studentid,schoolid:schoolid, standadid:standadid, ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.cover,image: AssetImage("assets/image/Rectangle.png")),  color: Colors.blue,),

        child: ListView.builder(
          itemCount: getteacherdata.length,
          itemBuilder: (context, index) {
            TeacherModel teacher = getteacherdata[index];
            return Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 150,
                    width: 340,
                    decoration: BoxDecoration(
                        color: Colors.greenAccent,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        Text(
                          "${teacher.teacherName}",
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 50),
                            child: Column(
                              children: [
                                TeacherData("Education", "${teacher.teacherEducation}"),
                                TeacherData("About", "${teacher.teacherDetail}"),
                                TeacherData("Contact", "${teacher.teacherPhone}"),
                                TeacherData("M.A", "${teacher.teacherEmail}"),
                              ],
                            )),

                      ],
                    ),
                  ),

                ],
              ),
            );
            //   ListTile(
            //   leading: CircleAvatar(
            //     backgroundImage: NetworkImage(teacher.teacherImage), // assuming teacherImage is a URL
            //   ),
            //   title: Text(teacher.teacherName,style: TextStyle(color: Colors.white),),
            //   subtitle: Text(teacher.teacherEmail,style: TextStyle(color: Colors.white),),
            // );
          },
        ),
      ),
    );
  }

  Widget TeacherData(
    key1,
    value1,
  ) {
    return Row(
      children: [
        Expanded(flex:30,child: Text(key1,style: TextStyle(fontWeight: FontWeight.bold),)),
        Expanded(flex: 70,child: Text(value1)),
      ],
    );
  }
}
