// // import 'package:flutter/material.dart';
// // import 'package:myschoolmanagement/view/result.dart';
// //
// // import '../model/Student_Attendence.dart';
// //
// // class Student_Attendence extends StatefulWidget {
// //   final List<AttandanceModel> getattendencedata;
// //   final String studentid;
// //   final String schoolid;
// //   final String standadid;
// //   Student_Attendence({super.key, required this.getattendencedata
// //     , required this.studentid,
// //     required this.schoolid,
// //     required this. standadid,});
// //   OptionMenu my=OptionMenu(schoolid: "",standadid: "",studentId: "",);
// //   @override
// //   State<Student_Attendence> createState() => _Student_AttendanceState();
// // }
// //
// // class _Student_AttendanceState extends State<Student_Attendence> {
// //   DateTime selectedDate = DateTime.now();
// //   void attendence(int year, int month) {
// //     setState(() {
// //       selectedDate = DateTime(year, month);
// //     });
// //   }
// //
// //   void updateSelectedDate(DateTime date) {
// //     setState(() {
// //       selectedDate = date;
// //     });
// //   }
// //
// //   List<AttandanceModel> getAttendanceForSelectedMonth() {
// //     return widget.getattendencedata
// //         .where((attendance) =>
// //     attendance.attendenceDate.year == selectedDate.year &&
// //         attendance.attendenceDate.month == selectedDate.month)
// //         .toList();
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     List<AttandanceModel> attendanceData = getAttendanceForSelectedMonth();
// //
// //     return Scaffold(
// //       appBar: AppBar(
// //         foregroundColor: Colors.white,
// //         backgroundColor: Colors.blue.shade900,
// //         title: Text("Attendance",style: TextStyle(color: Colors.white),),
// //         actions: <Widget>[
// //         OptionMenu(studentId:widget.studentid,schoolid:widget.schoolid,standadid: widget.standadid, ),
// //       ],
// //       ),
// //       body: Column(
// //         children: [
// //           MonthPicker(
// //             initialYear: selectedDate.year,
// //             startYear: 2000,
// //             endYear: DateTime.now().year,
// //             month: selectedDate.month,
// //             onDateChanged: updateSelectedDate,
// //             parent: this, // Pass the _Student_homeState instance
// //           ),
// //           SizedBox(height: 5),
// //           Expanded(
// //             child: GridView.builder(
// //               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// //                 crossAxisCount: 4,
// //               ),
// //               itemCount: DateTime(selectedDate.year, selectedDate.month + 1, 0).day, // Get number of days in selected month
// //               itemBuilder: (context, index) {
// //                 int day = index + 1;
// //                 AttandanceModel? attendance = attendanceData.firstWhere(
// //                         (attendance) => attendance.attendenceDate.day == day,
// //                     orElse: () => AttandanceModel.empty());
// //                 bool isPresent = attendance.attended == "false";
// //                 String status = isPresent ? "Absent" : "Present";
// //                 String status2 = isPresent ? "A\n$day" : "P\n$day";
// //                 String comment = attendance.attendenceReason;
// //
// //                 return GestureDetector(
// //                   onTap: () {
// //                     showDialog(
// //                       context: context,
// //                       builder: (context) => AlertDialog(
// //                         title: Text("Attendance Details"),
// //                         content: Text("Date: $day\nStatus: $status\nComment: $comment"),
// //                         actions: [
// //                           TextButton(
// //                             onPressed: () {
// //                               Navigator.of(context).pop();
// //                             },
// //                             child: Text("Close"),
// //                           ),
// //                         ],
// //                       ),
// //                     );
// //                   },
// //                   child: Card(
// //                     color: isPresent ?Colors.red  : Colors.green,
// //                     child: Center(
// //                       child: Text('$status2'),
// //                     ),
// //                   ),
// //                 );
// //               },
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
// //
// // class MonthPicker extends StatefulWidget {
// //   final int initialYear;
// //   final int startYear;
// //   final int endYear;
// //   final int month;
// //   final ValueChanged<DateTime> onDateChanged;
// //   final _Student_AttendanceState parent; // Change the type to _Student_AttendanceState
// //
// //   MonthPicker({
// //     required this.initialYear,
// //     required this.startYear,
// //     required this.endYear,
// //     required this.month,
// //     required this.onDateChanged,
// //     required this.parent, // Change the type to _Student_AttendanceState
// //     Key? key,
// //   }) : super(key: key);
// //
// //   @override
// //   State<MonthPicker> createState() => _MonthPickerState();
// // }
// //
// // class _MonthPickerState extends State<MonthPicker> {
// //   final List<String> _monthList = [
// //     "January", "February", "March", "April", "May", "June",
// //     "July", "August", "September", "October", "November", "December"
// //   ];
// //   List<String> _yearList = [];
// //   late int selectedMonthIndex;
// //   late int selectedYearIndex;
// //   String selectedMonth = "";
// //   String selectedYear = "";
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //
// //     for (int i = widget.startYear; i <= widget.endYear; i++) {
// //       _yearList.add(i.toString());
// //     }
// //     selectedMonthIndex = widget.month - 1;
// //     selectedYearIndex = _yearList.indexOf(widget.initialYear.toString());
// //
// //     WidgetsBinding.instance.addPostFrameCallback((_) {
// //       setState(() {
// //         selectedMonth = _monthList[selectedMonthIndex];
// //         selectedYear = _yearList[selectedYearIndex];
// //       });
// //     });
// //   }
// //
// //   void _updateDate() {
// //     widget.onDateChanged(DateTime(
// //       int.parse(selectedYear),
// //       selectedMonthIndex + 1,
// //     ));
// //     widget.parent.attendence(int.parse(selectedYear), selectedMonthIndex + 1);
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
// //       child: Column(
// //         mainAxisSize: MainAxisSize.min,
// //         children: [
// //           Container(
// //             padding: EdgeInsets.only(left: 20),
// //
// //             height: 60,
// //             width: double.infinity,
// //             child: Row(
// //               children: [
// //                 Expanded(
// //                   flex: 35,
// //                   child: DropdownButton<String>(
// //                     underline: Container(),
// //                     items: _monthList.map((e) {
// //                       return DropdownMenuItem<String>(
// //                         value: e,
// //                         child: Text(e),
// //                       );
// //                     }).toList(),
// //                     value: selectedMonth,
// //                     onChanged: (val) {
// //                       setState(() {
// //                         selectedMonthIndex = _monthList.indexOf(val!);
// //                         selectedMonth = val;
// //                         _updateDate();
// //                       });
// //                     },
// //                   ),
// //                 ),
// //                 const SizedBox(width: 20),
// //                 Expanded(
// //                   flex: 35,
// //                   child: DropdownButton<String>(
// //                     underline: Container(),
// //                     items: _yearList.map((e) {
// //                       return DropdownMenuItem<String>(
// //                         value: e,
// //                         child: Text(e),
// //                       );
// //                     }).toList(),
// //                     value: selectedYear,
// //                     onChanged: (val) {
// //                       setState(() {
// //                         selectedYearIndex = _yearList.indexOf(val!);
// //                         selectedYear = val;
// //                         _updateDate();
// //                       });
// //                     },
// //                   ),
// //                 ),
// //
// //               ],
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
// //
// //

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myschoolmanagement/view/result.dart';
import 'dart:convert';

import '../model/Student_Attendence.dart';

class Student_Attendence extends StatefulWidget {
  final List<AttandanceModel> getattendencedata;
  final String studentid;
  final String schoolid;
  final String standadid;
  Student_Attendence({super.key, required this.getattendencedata
    , required this.studentid,
    required this.schoolid,
    required this. standadid,});

  @override
  State<Student_Attendence> createState() => _Student_AttendanceState();
}

class _Student_AttendanceState extends State<Student_Attendence> {
  DateTime selectedDate = DateTime.now();
  List<AttandanceModel> MYattendanceData = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchAttendanceData(selectedDate.year, selectedDate.month);
  }

  Future<void> fetchAttendanceData(int year, int month) async {
    setState(() {
      isLoading = true;
    });

    try {
      final response = await http.post(
        Uri.parse('http://schoolportal.mtemporary.hol.es/index.php/api/get_student_attendence'),
        body: {
          'student_id': widget.studentid,
          'year': year.toString(),
          'month': month.toString(),
        },
      );

      if (response.statusCode == 200) {
        String data = response.body;
        StudentAttandance attendencedata = StudentAttandance.fromJson(jsonDecode(data));

        if (attendencedata.responce) {
          setState(() {
            MYattendanceData = attendencedata.data;
          });
        } else {
          _showSnackBar('Failed to fetch attendance data!');
        }
      } else {
        _showSnackBar('Failed to fetch attendance data!');
      }
    } catch (e) {
      _showSnackBar('No Response');
      print(e.toString());
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void updateSelectedDate(DateTime date) {
    setState(() {
      selectedDate = date;
    });
    fetchAttendanceData(date.year, date.month);
  }

  List<AttandanceModel> getAttendanceForSelectedMonth() {
    return MYattendanceData
        .where((attendance) =>
    attendance.attendenceDate.year == selectedDate.year &&
        attendance.attendenceDate.month == selectedDate.month)
        .toList();
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    // Update attendanceData whenever selectedDate changes
    List<AttandanceModel> filteredAttendanceData = getAttendanceForSelectedMonth();

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue.shade900,
        title: Text("Attendance",style: TextStyle(color: Colors.white),),
        actions: <Widget>[
        OptionMenu(studentId:widget.studentid,schoolid:widget.schoolid,standadid: widget.standadid, ),
      ],
      ),
      body: Column(
        children: [
          MonthPicker(
            initialYear: selectedDate.year,
            startYear: 1998,
            endYear: DateTime.now().year,
            month: selectedDate.month,
            onDateChanged: updateSelectedDate,
          ),
          SizedBox(height: 5),
          isLoading
              ? Center(child: CircularProgressIndicator())
              : Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
              ),
              itemCount: DateTime(selectedDate.year, selectedDate.month + 1, 0).day,
              itemBuilder: (context, index) {
                int day = index + 1;
                AttandanceModel attendance = filteredAttendanceData.firstWhere(
                      (attendance) => attendance.attendenceDate.day == day,
                  orElse: () => AttandanceModel.empty(),
                );

                // bool isPresent = attendance.attended=="false" ;
                // print("dataattendance${attendance.attended }");
                // String status2 = isPresent ? "A\n$day" : "P\n$day";
                String status2;
                Color statusColor;

                if (attendance.attended == "1") {
                  status2 = "P";
                  statusColor = Colors.green;
                } else if (attendance.attended == "0") {
                  status2 = "A";
                  statusColor = Colors.red;
                } else {
                  status2 = "N/A"; // No data available
                  statusColor = Colors.grey; // or any other color for no data
                }
                print("${attendance.attended}");
                String comment = attendance.attendenceReason;

                return GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text("Attendance Details"),
                        content: Text("Date: $day\nComment: ${attendance.attendenceReason ?? 'No comment'}"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text("Close"),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Card(
                    // color: isPresent ? Colors.red : Colors.green,

                    child: Center(
                      child: Column(
                        children: [
                          SizedBox(height: 10,),
                          Text(' $status2',style: TextStyle( color: statusColor,fontSize: 20),),
                          SizedBox(height: 10,),
                          Text('$day',style: TextStyle( color: Colors.grey)),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
class MonthPicker extends StatefulWidget {
  final int initialYear;
  final int startYear;
  final int endYear;
  final int month;
  final ValueChanged<DateTime> onDateChanged;

  MonthPicker({
    required this.initialYear,
    required this.startYear,
    required this.endYear,
    required this.month,
    required this.onDateChanged,
    Key? key,
  }) : super(key: key);

  @override
  State<MonthPicker> createState() => _MonthPickerState();
}

class _MonthPickerState extends State<MonthPicker> {
  final List<String> _monthList = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];
  List<String> _yearList = [];
  late int selectedMonthIndex;
  late int selectedYearIndex;
  String selectedMonth = "";
  String selectedYear = "";

  @override
  void initState() {
    super.initState();

    for (int i = widget.startYear; i <= widget.endYear; i++) {
      _yearList.add(i.toString());
    }
    selectedMonthIndex = widget.month - 1;
    selectedYearIndex = _yearList.indexOf(widget.initialYear.toString());

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        selectedMonth = _monthList[selectedMonthIndex];
        selectedYear = _yearList[selectedYearIndex];
      });
    });
  }

  void _updateDate() {
    widget.onDateChanged(DateTime(
      int.parse(selectedYear),
      selectedMonthIndex + 1,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(left: 20),
            height: 60,
            width: double.infinity,
            child: Row(
              children: [
                Expanded(
                  child: DropdownButton<String>(
                    underline: Container(),
                    items: _monthList.map((e) {
                      return DropdownMenuItem<String>(
                        value: e,
                        child: Text(e),
                      );
                    }).toList(),
                    value: selectedMonth.isNotEmpty ? selectedMonth : null,
                    onChanged: (val) {
                      setState(() {
                        selectedMonthIndex = _monthList.indexOf(val!);
                        selectedMonth = val;
                        _updateDate();
                      });
                    },
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: DropdownButton<String>(
                    underline: Container(),
                    items: _yearList.map((e) {
                      return DropdownMenuItem<String>(
                        value: e,
                        child: Text(e),
                      );
                    }).toList(),
                    value: selectedYear.isNotEmpty ? selectedYear : null,
                    onChanged: (val) {
                      setState(() {
                        selectedYearIndex = _yearList.indexOf(val!);
                        selectedYear = val;
                        _updateDate();
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

