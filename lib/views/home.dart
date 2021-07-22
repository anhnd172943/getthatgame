import 'package:flutter/material.dart';
import 'package:get_that_game/main.dart';
import 'package:get_that_game/resources/color.dart';
import 'package:get_that_game/resources/decorate.dart';
import 'package:get_that_game/views/login.dart';

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: MyDecoration().backgroundDecoration(),
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 60,),
              Image.asset("assets/logo.png"),
              Text("Get any game you want",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 28,
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(height: 20,),
              /*Container(
                width: MediaQuery.of(context).size.width-70,
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 50,
                      child: TextField(
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
                    Container(
                      height: 50,
                      child: TextField(
                        style: TextStyle(
                          color: Colors.white70
                        ),

                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: "Password",
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
                  ],
                ),
              ),*/
              SizedBox (height: 20,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => LoginView()
                  ));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width-70,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 17),
                  decoration: BoxDecoration(
                      color: barColor,
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          offset: Offset(5.0, 5.0),
                          blurRadius: 15.0,
                          color: Color(0xff2a4788).withOpacity(0.8),
                        )
                      ],
                      borderRadius: BorderRadius.circular(6)
                  ),
                  child: Text("Get Start".toUpperCase(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}