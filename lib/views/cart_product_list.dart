import 'package:flutter/material.dart';
import 'package:get_that_game/models/cardmodels/cartmodel.dart';
import 'package:get_that_game/models/product_model.dart';
import 'package:get_that_game/services/cart_item_change.dart';
import 'package:get_that_game/services/database.dart';
import 'package:provider/provider.dart';
import 'package:get_that_game/resources/decorate.dart';
import 'package:get_that_game/resources/color.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class CartProductsList extends StatefulWidget {
  @override
  _CartProductsListState createState() => _CartProductsListState();
}

class _CartProductsListState extends State<CartProductsList> {



  @override
  Widget build(BuildContext context) {



    final cartItem = Provider.of<List<ProductModel>>(context);
    int _price = 0;





    void removeItem(index){
      DatabaseService().cartCollection.where('Product Name', isEqualTo: cartItem[index].productName)
          .get().then((value){
        value.docs.singleWhere((element){
          DatabaseService().cartCollection.doc(element.id).delete();
        });
      });
    }

    return Stack(
      alignment: Alignment.bottomRight,
      children: <Widget>[
        Container(
          decoration: MyDecoration().modelBoxDecoration(),
          width: MediaQuery.of(context).size.width-30,
          height: MediaQuery.of(context).size.height-240,
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              child: ListView.builder(
                  itemCount: cartItem.length ?? 0,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index){
                    return CartModel(
                      cartProduct: cartItem[index],
                      removeProduct: (){
                        removeItem(index);
                        setState(() {
                          _price += cartItem[index].priceInVND;
                        });
                      },
                    );
                  }

                /*CartModel(
                                    cartProduct: snapshot.data.documents[index],
                                  ),*/
              )
          ),
        ),
        /*Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),

          child: Align(
            child: Text(
              "Total: $_price VND",
              textAlign: TextAlign.end,
              style: TextStyle(
                  color: importanceRed,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    buildShadow()
                  ]
              ),
            ),
          ),
        ),*/
      ],
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
