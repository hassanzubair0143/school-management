import 'package:flutter/material.dart';

import '../model/result_report.dart';

class Reault_Details extends StatelessWidget {
  final List<Result_Report> getdetails;
  final String StudentSubject;

  Reault_Details({super.key, required this.getdetails,required this.StudentSubject});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue.shade900,
        title: Text(
          'Result Details',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
        child: ListView.builder(
          itemCount: getdetails.length,
          itemBuilder: (context, index) {
            Result_Report result = getdetails[index];
            return Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    height: 150,
                    width: double.infinity,
                    color: Colors.black54,
                    child: Column(mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20,),
                      Text("Student Name: ${result.subject}",style: TextStyle(color: Colors.white),),
                        SizedBox(height: 20,),
                      Row(
                        children: [
                          Text("${StudentSubject}",style: TextStyle(color: Colors.white),),
                          SizedBox(width: 100,),
                          Text("${result.markObtain}.0 % ",style: TextStyle(color: Colors.white,fontSize: 30),)
                        ],
                      ),

                      Row(
                        children: [
                          Text("${result.onDate.year} -",style: TextStyle(color: Colors.white),),
                          Text(" 0${result.onDate.month} -",style: TextStyle(color: Colors.white),),
                          Text(" ${result.onDate.day}",style: TextStyle(color: Colors.white),),
                        ],
                      )
                    ],),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20,top: 10),
                    height: 40,
                    width: 340,
                    decoration: BoxDecoration(
                        color: Colors.black54,
                        // borderRadius: BorderRadius.circular(20)
                    ),
                    child: Column(
                      children: [
                        Row(children: [
                          Text("Subject",style: TextStyle(color: Colors.white),),
                          SizedBox(width: 80,),
                          Text("Marks",style: TextStyle(color: Colors.white),),
                          SizedBox(width: 70,),
                          Text("Obtain",style: TextStyle(color: Colors.white),),
                        ]),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    padding: EdgeInsets.only(left: 20,top: 10),
                    height: 40,
                    width: 340,
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      // borderRadius: BorderRadius.circular(20)
                    ),
                    child: Column(
                      children: [
                        Row(children: [
                          Text("${result.subject}",style: TextStyle(color: Colors.white),),
                          SizedBox(width: 110,),
                          Text("${result.totalMark}",style: TextStyle(color: Colors.white),),
                          SizedBox(width:80,),
                          Text("${result.markObtain}",style: TextStyle(color: Colors.white),),
                        ]),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    padding: EdgeInsets.only(left: 20,top: 10),
                    height: 40,
                    width: 340,
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      // borderRadius: BorderRadius.circular(20)
                    ),
                    child: Column(
                      children: [
                        Row(children: [
                          Text("Total Marks",style: TextStyle(color: Colors.white),),
                          SizedBox(width: 60,),
                          Text("${result.totalMark}.0",style: TextStyle(color: Colors.white),),
                          SizedBox(width: 70,),
                          Text("${result.markObtain}.0",style: TextStyle(color: Colors.white),),
                        ]),
                      ],
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
