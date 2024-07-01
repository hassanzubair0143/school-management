import 'package:flutter/material.dart';
import 'package:myschoolmanagement/view/result.dart';

import '../model/school_noticeboard.dart';
import '../model/student_event.dart';
class News_Event extends StatelessWidget {
  final  List<Notice> getnoticedata;
  final String studentid;
  final String schoolid;
  final String standadid;
 News_Event({super.key,required this.getnoticedata , required this.studentid,
    required this.schoolid,
    required this. standadid,});
  OptionMenu my=OptionMenu(schoolid: "",standadid: "",studentId: "",);
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(foregroundColor: Colors.white,
        backgroundColor: Colors.blue.shade900,
        title: Text('Notice',style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          OptionMenu(studentId:studentid,schoolid:schoolid, standadid:standadid, ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.cover,image: AssetImage("assets/image/Rectangle.png")),  color: Colors.blue,),

        child: ListView.builder(
          itemCount: getnoticedata.length,
          itemBuilder: (context, index) {
            Notice notice = getnoticedata[index];
            return
              Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 80,
                      width: 350,
                      decoration: BoxDecoration(
                          color: Colors.greenAccent,
                          borderRadius: BorderRadius.circular(20)),
                      child:
                      ListTile(
                        leading:Text("${notice.noticeType}"),
                        title: Text("${notice.onDate}"),
                        subtitle: Text("${notice.noticeDescription}"),
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

