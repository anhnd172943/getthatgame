import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get_that_game/resources/decorate.dart';
import 'package:provider/provider.dart';
import 'package:get_that_game/services/database.dart';
import 'package:get_that_game/models/user_model.dart';

class UserCard extends StatelessWidget{
  @override
  Widget build(BuildContext context) {


    // TODO: implement build
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      height: 75,
      width: MediaQuery.of(context).size.width - 30,
      decoration: MyDecoration().modelBoxDecoration(),
      child: Wrap(
        direction: Axis.vertical,
        children: [
          Text(
            'NDA',
            style: TextStyle(
              color: Colors.amber,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.fade,
          ),
          Text(
            "nda@gmail.com",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}

