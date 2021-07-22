import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_that_game/views/cart.dart';
import 'package:get_that_game/main.dart';
import 'package:get_that_game/resources/color.dart';

class MyDecoration{
  BoxDecoration modelBoxDecoration(){
    return BoxDecoration(
      border: Border.all(
        color: Color(0xff2778ff).withOpacity(0.1),
        width: 2,
      ),
      gradient: LinearGradient(
        colors: [cardColor, cardColor2],
      ),
      borderRadius: BorderRadius.circular(16),
      boxShadow: <BoxShadow>[
        BoxShadow(
          offset: Offset(1.0, 1.0),
          blurRadius: 15.0,
          color: Colors.black87.withOpacity(0.2),
        ),
      ],
    );
  }
  BoxDecoration backgroundDecoration(){
    return BoxDecoration(
      gradient: LinearGradient(
          colors: [backgroundColor, backgroundColor2]
      ),
    );
  }
  BoxDecoration buttonDecoration(){
    return BoxDecoration(
        color: barColor,
        boxShadow: <BoxShadow>[
          BoxShadow(
            offset: Offset(5.0, 5.0),
            blurRadius: 15.0,
            color: Color(0xff2a4788).withOpacity(0.8),
          )
        ],
        borderRadius: BorderRadius.circular(6)
    );
  }
}



class MyTextStyle{
  TextStyle cardTextStyle() {
    return TextStyle(
      color: Colors.white,
      fontSize: 25,
      fontWeight: FontWeight.bold,
    );
  }
  TextStyle requirementTextStyle() {
    return TextStyle(
      color: Colors.white70,
      fontSize: 15,
    );
  }
}



