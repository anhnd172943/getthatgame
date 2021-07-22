import 'dart:async';
import 'package:get_that_game/views/my_home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_that_game/models/user_model.dart';
import 'package:get_that_game/resources/color.dart';
import 'package:get_that_game/resources/decorate.dart';
import 'package:get_that_game/main.dart';
import 'package:get_that_game/views/register.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_that_game/services/auth.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  final AuthService _auth = AuthService();

  //thuoc tinh va controller
  String email = '';
  String password = '';
  String _notify = '';
  final emailEditController = new TextEditingController();
  final passwordEditController = new TextEditingController();


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
              SizedBox(height: 60,),
              Container(
                child: Text('Login',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 80,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic
                ),),
              ),
              SizedBox(
                height: 50,
              ),
                //Username
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
                //SignInButton
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 140,
                    child: GestureDetector(
                      onTap: () async {
                        //kiem tra thong tin
                        if (emailEditController.text.isEmpty || passwordEditController.text.isEmpty){
                          this.setState(() {
                            _notify = 'Email or password missing, please enter your email or password';
                          });
                        }

                        //kiem tra tai khoan ton tai
                        else{
                          dynamic result = await _auth.emailLogin(emailEditController.text, passwordEditController.text);
                          if (result == null){
                            setState(() {
                              _notify = 'Could not login, please check if your email or password is correct';
                            });
                          }
                          //dang nhap
                          else {
                            this.setState(() {
                              _notify = 'Loading...';
                            });
                            Timer(Duration(seconds: 2), (){
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => MyHomePage()
                              ));
                            });

                          }
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 17),
                        decoration: MyDecoration().buttonDecoration(),
                        child: Text("Login".toUpperCase(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),
                  Container(
                    width: 140,
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => RegisterView()
                        ));
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
                  )
                ],
              ),
              SizedBox(height: 20,),
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
