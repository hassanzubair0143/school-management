import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:myschoolmanagement/view/student_home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/login_student.dart';
import 'loginwith_phone.dart';

class UserLogin extends StatefulWidget {
  const UserLogin({super.key});

  @override
  State<UserLogin> createState() => _UserLoginState();
}
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

TextEditingController userController = TextEditingController();
TextEditingController passwordController = TextEditingController();
class _UserLoginState extends State<UserLogin> {
  void login(String username, String password) async {
    try {
      Response response = await post(
          Uri.parse(
              'http://schoolportal.mtemporary.hol.es/index.php/api/login'),
          body: {'student_user_name': username, 'student_password': password});

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
        userController.clear();
        passwordController.clear();
        print(jsonDecode(data).toString());
      }
      else {
        print("Error");
      }
    } catch (e) {
      _showSnackBar('Login failed!');
      print(e.toString());
    }
  }
  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }
  @override
  Widget build(BuildContext context) {
    return

      SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
                child: Column(
              children: [
                Container(
                  height: 265,
                  width: 512,
                  child: Image.asset("assets/image/Component 1.png"),
                ),
                SizedBox(height: 70,),
                Container(
                  margin: EdgeInsets.only(left: 25, right: 25),
                  child: Column(
                    children: [
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: userController,
                              decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.green),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue.shade900),
                                  ),
                                  hintText: "Enter User Name",
                                  labelText: 'User Name',
                                  suffixIcon: Icon(Icons.person)),
                              keyboardType: TextInputType.name,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter UserName';
                                }
                              },

                            ),


                      SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        controller: passwordController,
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue.shade900),
                            ),
                            hintText: "Enter Password",
                            labelText: 'Password',

                            suffixIcon: Icon(Icons.key)),
                        keyboardType:TextInputType.name,
                        obscureText: true,
                        obscuringCharacter: '*',

                        validator: (value) {
                      if (value == null || value.isEmpty) {
                      return 'Please enter Password';
                      }
                      },
                      ),   ],
                        ),),
                      SizedBox(height: 60,),
                      ElevatedButton(

                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(12)),
                                )
                            ),
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.blue.shade900),
                            minimumSize: MaterialStatePropertyAll(
                              Size(300, 50),
                            ),

                        ),
                        onPressed: () {
                          login(userController.text.toString(),
                              passwordController.text.toString());
                              setState(() {
    // login(_username.toString(), _password.toString());
    if (_formKey.currentState!.validate()) {
    login(userController.text.toString(),
    passwordController.text.toString()
    );
    }});

    },
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.white,fontSize: 20),
                        ),

                      ),
                      SizedBox(height: 30,),
                      // Text(
                      //   'Forgot Password ?',
                      //   style: TextStyle(color: Colors.black38,fontSize: 15),
                      // ),
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Otp_Call(),));
                      }, child:
                          Text(
                          'Login With phone',
                          style: TextStyle(color: Colors.black38,fontSize: 15),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )),
          ),
        ),
      );

  }
}
