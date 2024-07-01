import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:myschoolmanagement/view/student_home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/login_student.dart';


class Otp_Call extends StatefulWidget {
  const Otp_Call({super.key});

  @override
  State<Otp_Call> createState() => _Otp_CallState();
}

class _Otp_CallState extends State<Otp_Call> {
  // TextEditingController phonenumber=TextEditingController();

  String _phoneNumber = '';
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("OTP_UI"),
        ),
        body: Container(
          child: Column(
            children: [
              SizedBox(
                height: 250,
              ),
              IntlPhoneField(
                // controller: phonenumber,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                ),
                initialCountryCode: 'PK',
                onChanged: (phone) {
                  setState(() {
                    _phoneNumber = phone.completeNumber;
                  });
                  print(phone.completeNumber);
                },
              ),

              SizedBox(height: 30,),
              _isLoading
                  ? CircularProgressIndicator()
                  : ElevatedButton(onPressed: ()async {

                if (_phoneNumber.isNotEmpty) {
                  setState(() {
                    _isLoading = true;
                  });
                  await FirebaseAuth.instance.verifyPhoneNumber(
                    verificationCompleted: (PhoneAuthCredential credential) {
                      setState(() {
                        _isLoading = false;
                      });
                    },


                    verificationFailed: (FirebaseAuthException e) {
                      setState(() {
                        _isLoading = false;
                      });
                      if (e.code == 'invalid-phone-number') {
                        print('The provided phone number is not valid.');
                      } else {
                        print('Phone number verification failed. Code: ${e.code}. Message: ${e.message}');
                      }},
                    codeSent: (String verificationId, int? resendToken) {
                      setState(() {
                        _isLoading = false;
                      });
                      print('Verification code sent');
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  Get_Otp(reOtp: verificationId),));

                    },
                    codeAutoRetrievalTimeout: (String verificationId) {
                      setState(() {
                        _isLoading = false;
                      });
                      print('Auto retrieval timeout');},
                    phoneNumber: _phoneNumber ,
                  );}else {
                  print('Please enter a valid phone number');
                }
              }, child: Text("GET OTP")),
            ],
          ),
        ));
  }
}

class Get_Otp extends StatefulWidget {
  String reOtp;

  Get_Otp({super.key, required this.reOtp});

  @override
  State<Get_Otp> createState() => _Get_OtpState();
}

class _Get_OtpState extends State<Get_Otp> {
  TextEditingController otpphonenumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Get-OTP-UI"),
        ),
        body: Container(
          child: Column(
            children: [
              SizedBox(
                height: 250,
              ),
              TextField(
                controller: otpphonenumber,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30))),

              ),
              SizedBox(height: 30,),
              ElevatedButton(onPressed: () async {
                try {
                  PhoneAuthCredential credential = await PhoneAuthProvider
                      .credential(verificationId: widget.reOtp,
                      smsCode: otpphonenumber.text.toString());
                  FirebaseAuth.instance.signInWithCredential(credential).then((
                      value) {
                    setState(() {
                      login(context);
                    });

                   // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => login(),));
                  }
                  );
                } catch(e){
                  print(e.toString());
                }
                // Navigator.push(context, MaterialPageRoute(builder: (context) =>  Student_home(),));

              }  , child: Text("Send OTP")),
            ],
          ),
        ));
  }
}


void login(BuildContext context) async {
  try {
    Response response = await post(
        Uri.parse(
            'http://schoolportal.mtemporary.hol.es/index.php/api/login'),
        body: {'student_user_name': "arfa", 'student_password': "admin"});

    String data = response.body;
    Login login1 = Login.fromJson(jsonDecode(response.body));
    if (jsonDecode(data)['responce'].toString() == "true") {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('student', jsonEncode(login1.data.toJson()));
      await prefs.setBool('isLoggedIn', true);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Student_home(listdata: login1.data)),

      );
      // .then((value) {
      //   //This makes sure the textfield is cleared after page is pushed.
      //   userController.clear();
      //   passwordController.clear();
      // });

      print(jsonDecode(data).toString());
    }
    else {
      print("Error");
    }
  } catch (e) {

    print(e.toString());
  }
}
void _showSnackBar(String message,BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}