import 'package:flutter/material.dart';
import 'package:get_that_game/models/product_model.dart';
import 'package:get_that_game/resources/color.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_that_game/services/database.dart';
import 'package:get_that_game/services/storage.dart';
import 'package:provider/provider.dart';


class CartModel extends StatelessWidget{

  final ProductModel cartProduct;
  final Function removeProduct;
  final Function getPrice;

  CartModel({this.cartProduct, this.removeProduct, this.getPrice});



  @override
  Widget build(BuildContext context) {

    return Container(
      height: 80,
      decoration: BoxDecoration(
          color: Colors.transparent
      ),
      child: Stack(
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.start,
              direction: Axis.horizontal,
              children: <Widget>[
                FutureBuilder(
                  future: FirebaseStorageService().getImage(context, cartProduct.imgName),
                  builder: (context, snapshot){
                    return Container(
                      height: 70
                      ,
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: snapshot.data,
                    );
                  },
                ),
                SizedBox (width: 5,),
                Wrap(
                  direction: Axis.vertical,
                  children: <Widget>[
                    Text(
                      "${cartProduct.productName}",
                      style: TextStyle(
                        color: Colors.amber,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "${cartProduct.priceInVND}",
                      style: TextStyle(
                          color: importanceRed,
                          fontSize: 18
                      ),
                    )
                  ],
                ),
                //Delete from cart button
              ],
            ),
          ),
          //delete from cart button
          Container(
            alignment: Alignment.centerRight,
            height: 35,
            child: IconButton(
              onPressed: removeProduct,
              icon: SvgPicture.asset(
                "assets/clear.svg",
                fit: BoxFit.contain,
                color: Colors.white70,
              ),
            ),
          ),
        ],
      ),
    );

  }
}