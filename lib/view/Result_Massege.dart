import 'package:flutter/material.dart';

import '../model/send_enquiry.dart';
class Result_Massage extends StatefulWidget {
  final List<Student_Enquiry> getenquiy;

  Result_Massage({super.key, required this.getenquiy});

  @override
  State<Result_Massage> createState() => _Result_MassageState();
}

class _Result_MassageState extends State<Result_Massage> {
  TextEditingController _textFieldController1 = TextEditingController();

  TextEditingController _textFieldController2 = TextEditingController();

  @override
  void dispose() {
    _textFieldController1.dispose();
    _textFieldController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue.shade900,
        title: Text(
          'Enquiy',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
        child: Column(
          children: [
            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              _showAlertDialog(context);

            }, child: Text("+NEW MESSAGE")),
            Expanded(
              child: ListView.builder(
                itemCount: widget.getenquiy.length,
                itemBuilder: (context, index) {
                  Student_Enquiry result = widget.getenquiy[index];
                  return Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),

                        ListTile(
                         title: Text("${result.subject}"),
                          subtitle: Text("${result.message}"),
                          trailing: Text("${result.onDate}"),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enquiry Message'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: _textFieldController1,
                decoration: InputDecoration(labelText: 'Subject'),
              ),
              TextField(
                controller: _textFieldController2,
                decoration: InputDecoration(labelText: 'Message'),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Send'),
              onPressed: () {
                // Get the text from the text fields
                String subject = _textFieldController1.text;
                String message = _textFieldController2.text;

                // Create a new StudentEnquiry object
                Student_Enquiry newEnquiry = Student_Enquiry(
                  chatId: 'dummyChatId', // Provide a valid chatId
                  studentId: 'dummyStudentId', // Provide a valid studentId
                  schoolId: 'dummySchoolId', // Provide a valid schoolId
                  subject: subject,
                  message: message,
                  reply: 'dummyReply', // Provide a valid reply or make it optional
                  onDate: DateTime.now(), // Use DateTime.now() for current date and time
                );

                // Add the new enquiry to the list
                setState(() {
                  widget.getenquiy.add(newEnquiry);
                });

                // Clear text fields and dismiss dialog
                _textFieldController1.clear();
                _textFieldController2.clear();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
