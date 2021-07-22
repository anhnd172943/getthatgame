import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_that_game/resources/color.dart';
import 'package:get_that_game/resources/decorate.dart';
import 'package:get_that_game/main.dart';
import 'package:get_that_game/services/auth.dart';
import 'package:get_that_game/services/database.dart';
import 'package:get_that_game/views/login.dart';

class RegisterView extends StatefulWidget {
  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {

  final AuthService _auth = AuthService();


  //text field state and controller
  String email = '';
  String password = '';
  String userName = '';
  String _notify = '';
  final emailEditController = new TextEditingController();
  final passwordEditController = new TextEditingController();
  final userNameEditController = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: MyDecoration().backgroundDecoration(),
        child: Container(
          width: MediaQuery.of(context).size.width-70,
          child: Column(
            children: <Widget>[
              SizedBox(height: 80,),
              Container(
                child: Text('Register',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 80,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic
                  ),),
              ),
              SizedBox(
                height: 40,
              ),
              //username
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width - 30,
                child: TextFormField(
                  onChanged: (val){
                    userName = val;
                  },
                  controller: userNameEditController,
                  style: TextStyle(
                      color: Colors.white70
                  ),
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: "User Name:",
                    labelStyle: TextStyle(
                        color: Colors.white70
                    ),
                    border: OutlineInputBorder(
                      borderRadius: (BorderRadius.circular(10)),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.white70
                        )
                    ),
                  ),
                ),
              ),
              SizedBox (height: 10,),
              //Email
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width - 30,
                child: TextFormField(
                  onChanged: (val){
                    email = val;
                  },
                  controller: emailEditController,
                  style: TextStyle(
                      color: Colors.white70
                  ),
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: "Email:",
                    labelStyle: TextStyle(
                        color: Colors.white70
                    ),
                    border: OutlineInputBorder(
                      borderRadius: (BorderRadius.circular(10)),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.white70
                        )
                    ),
                  ),
                ),
              ),
              SizedBox (height: 10,),
              //Password
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width - 30,
                child: TextFormField(
                  onChanged: (val){
                    password = val;
                  },
                  controller: passwordEditController,
                  style: TextStyle(
                      color: Colors.white70
                  ),
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: "Password:",
                      labelStyle: TextStyle(
                          color: Colors.white70
                      ),
                      border: OutlineInputBorder(
                        borderRadius: (
                            BorderRadius.circular(10)
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.white70
                          )
                      )
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              //RegisterButton
              Container(
                width: 140,
                child: GestureDetector(
                  onTap: () async {
                    if (userNameEditController.text.isEmpty){
                      this.setState(() {
                        _notify = 'User Name not found';
                      });
                    }  else {
                      dynamic result = await _auth.emailRegister(emailEditController.text, passwordEditController.text, userNameEditController.text);
                      if (result != null){
                        //cap nha user name
                        this.setState(() {
                          _notify = 'Register complete, please wait a little bit';
                        });
                        Timer(Duration(seconds: 2), (){
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => LoginView()
                          ));
                        });
                      }
                      if (result == null){
                        this.setState(() {
                          _notify = 'Email or Password not found or avaible';
                        });
                      }
                    }

                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 17),
                    decoration: MyDecoration().buttonDecoration(),
                    child: Text("Register".toUpperCase(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15,),
              //SignInNotification
              Container(
                width: MediaQuery.of(context).size.width - 20,
                child: Text(
                  _notify,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: importanceRed,
                    fontSize: 30,
                    fontWeight: FontWeight.w200,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
