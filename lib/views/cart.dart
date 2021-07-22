import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_that_game/models/product_model.dart';
import 'package:get_that_game/resources/decorate.dart';
import 'package:get_that_game/resources/color.dart';
import 'dart:core';
import 'package:get_that_game/models/cardmodels/cartmodel.dart';
import 'package:get_that_game/models/cardmodels/usercardmodel.dart';
import 'package:get_that_game/data/cart_data.dart';
import 'package:get_that_game/services/database.dart';
import 'package:get_that_game/views/cart_product_list.dart';
import 'package:provider/provider.dart';


class CartInterface extends StatefulWidget{
  @override
  _CartInterface createState() => _CartInterface();
}

class _CartInterface extends State<CartInterface>{


  int _price = 0;

  final refData = FirebaseDatabase.instance;


  @override
  Widget build(BuildContext context) {

    final ref = refData.reference();




    return StreamProvider<List<ProductModel>>.value(
      value: DatabaseService().cartsItem,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: cardColor,
        ),
        body: SafeArea(
            child: Container(
              decoration: MyDecoration().backgroundDecoration(),
              child: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Wrap(
                      direction: Axis.vertical,
                      children: <Widget>[
                        SizedBox (height: 5,),
                        UserCard(),
                        SizedBox (height: 5,),
                        SingleChildScrollView(
                          child: CartProductsList(),
                        ),
                        SizedBox (height: 10,),

                      ],
                    ),
                  ),

                  Positioned(
                    child: GestureDetector(
                      onTap: (){

                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: cardColor
                        ),
                        child: Text(
                          "Pay Order",
                          style: TextStyle(
                              color: importanceRed,
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                buildShadow()
                              ]
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
        ),
      ),
    );

  }



  Shadow buildShadow() {
    return Shadow(
        color: Colors.black87.withOpacity(0.3),
        blurRadius: 15.0,
        offset: Offset(1.5, 1.5)
    );
  }








}





