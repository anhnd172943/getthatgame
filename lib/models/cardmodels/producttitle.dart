import 'package:flutter/material.dart';
import 'package:get_that_game/models/product_model.dart';
import 'package:get_that_game/models/starrating.dart';
import 'package:get_that_game/resources/decorate.dart';
import 'package:get_that_game/resources/color.dart';
import 'package:get_that_game/services/storage.dart';

class ProductTitle extends StatelessWidget {
  final ProductModel product;
  final Function press;
  ProductTitle({this.product, this.press});

  @override
  Widget build(BuildContext context) {


    return GestureDetector(
      onTap: press,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12),
        decoration: MyDecoration().modelBoxDecoration(),
        child: Wrap(
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          direction: Axis.vertical,
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  FutureBuilder(
                    future: FirebaseStorageService().getImage(context, product.imgName),
                    builder: (context, snapshot){
                      return Container(
                          height: 150,
                          child: snapshot.data
                        /*Image.asset(product.imgName ,height: 150,fit: BoxFit.cover,)*/
                      );
                    },
                  ),
                  Container(
                    height: 25,
                    width: 80,
                    margin: EdgeInsets.only(left: 8,top: 8),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6) ,
                        color: barColor.withOpacity(0.8)
                    ),
                    child: Text("${product.priceInVND} VND",style: TextStyle(
                        color: Colors.white
                    ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox (height: 3,),
            Text(
              product.productName.toString(),
              style: TextStyle(
                  color: Colors.white
              ),
            ),
            SizedBox(height: 3,),
            Row(
              children: <Widget>[
                StarRating(rating: product.rating,),
                SizedBox(width: 6,),
                Text("(${product.numberOfRating})", style: TextStyle(
                    color: Colors.white60,
                    fontSize: 12
                ),)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
