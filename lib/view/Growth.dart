import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http ;
import 'package:myschoolmanagement/view/result.dart';

import '../model/Student_Growth.dart';
import '../model/student_holiday.dart';

class Student_Growth extends StatefulWidget {
  final List<Growth> getgrowthdata;
  final String studentid;
  final String schoolid;
  final String standadid;
  Student_Growth({super.key, required this.getgrowthdata, required this.studentid,
  required this.schoolid,
  required this. standadid,});

  @override
  State<Student_Growth> createState() => _Student_GrowthState();
}

class _Student_GrowthState extends State<Student_Growth> {
  DateTime selectedDate = DateTime.now();
  List<Growth> MYholidayData = [];
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    fetchHolidayData(selectedDate.year, selectedDate.month);
  }
  Future<void> fetchHolidayData(int year, int month) async {
    setState(() {
      isLoading = true;
    });

    try {
      final response = await http.post(
        Uri.parse('http://schoolportal.mtemporary.hol.es/index.php/api/get_holidays'),
        body: {
          'school_id': widget.schoolid,
          'year': year.toString(),
          'month': month.toString(),
        },
      );

      if (response.statusCode == 200) {
        String data = response.body;
        StudentHoliday Growthdata = StudentHoliday.fromJson(jsonDecode(data));

        if (Growthdata.responce) {
          setState(() {
            MYholidayData= Growthdata.data;
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
  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }
  void updateSelectedDate(DateTime date) {
    setState(() {
      selectedDate = date;
    });
    fetchHolidayData(date.year, date.month);
  }

  List<Growth> getAttendanceForSelectedMonth() {
    return MYholidayData
        .where((holiday) =>
    holiday.holidayDate.year == selectedDate.year &&
        holiday.holidayDate.month == selectedDate.month)
        .toList();
  }
  OptionMenu my=OptionMenu(schoolid: "",standadid: "",studentId: "",);
  @override
  Widget build(BuildContext context) {
    // Update holidayDate whenever selectedDate changes
    List<Growth>  holidayDate = getAttendanceForSelectedMonth();

    return Scaffold(
      appBar: AppBar(foregroundColor: Colors.white,title: Text("Holiday"),backgroundColor:Colors.blue ,
        actions: <Widget>[
          OptionMenu(studentId:widget.studentid,schoolid:widget.schoolid, standadid:widget.standadid, ),
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
                Growth attendance = holidayDate .firstWhere(
                      (attendance) => attendance.holidayDate .day == day,
                  orElse: () => Growth.empty(),
                );

                bool isPresent = attendance.holidayId== "false";
                String comment = attendance.holidayTitle;

                // Color statusColor;
                // String status2;
                // if (attendance.holidayId == "1") {
                //   status2 = "P";
                //   statusColor = Colors.green;
                // } else if (attendance.holidayId == "0") {
                //   status2 = "A";
                //   statusColor = Colors.red;
                // } else {
                //   status2 = "N/A"; // No data available
                //   statusColor = Colors.grey; // or any other color for no data
                // }
                // print("${attendance.holidayId}");
                return GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text("Holiday Details"),
                        // content: Text("Date: $day\nComment: ${attendance.holidayTitle ?? 'No comment'}"),
                        content: Text("Date: $day\nComment: $comment"),
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
                    // child:
                    // Column(
                    //   children: [
                    //     SizedBox(height: 10,),
                    //     Text(' $status2',style: TextStyle( color: statusColor,fontSize: 20),),
                    //     SizedBox(height: 10,),
                    //     Text('$day',style: TextStyle( color: Colors.grey)),
                    //   ],
                    // ),
                    color: isPresent ? Colors.grey : Colors.green,
                    child: Center(
                      child: Column(
                        children: [
                          SizedBox(height: 10,),
                          Text(' $comment',style: TextStyle(color: Colors.white,fontSize: 20),),

                          Text(' $day',style: TextStyle(color: Colors.white),),
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
                    value: selectedMonth,
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
                    value: selectedYear,
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
