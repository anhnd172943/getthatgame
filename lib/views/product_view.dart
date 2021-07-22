import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_that_game/data/about.dart';
import 'package:get_that_game/models/product_model.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_that_game/services/cart_item_change.dart';
import 'package:get_that_game/views/cart.dart';
import 'package:get_that_game/resources/decorate.dart';
import 'package:get_that_game/resources/color.dart';
import 'package:get_that_game/models/starrating.dart';
import 'package:get_that_game/services/storage.dart';
import 'package:get_that_game/data/cart_data.dart';



/*
class MainProductView extends StatefulWidget{
  @override
  _MainProductView createState() => _MainProductView();
}

class _MainProductView extends State<MainProductView>{

  List<TrendingProductModel> trendingProducts = new List();
  List<ProductModel> products = new List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    trendingProducts = getTrendingProducts();
    products = getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView.builder(
          itemBuilder: (context, index){
            return ProductView(
              product: products[index],
            );
          }
      ),
    );
  }
} */

class ProductView extends StatefulWidget {

  final ProductModel product;

  ProductView({this.product});



  @override
  _ProductViewState createState() => _ProductViewState(product: this.product);
}

class _ProductViewState extends State<ProductView> {

  final ProductModel product;

  _ProductViewState({this.product});

  String _addToCart = 'Add to Cart';

  List<ProductModel> carts = new List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carts = CartData().cartItems;
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*floatingActionButton: FloatingActionButton.extended(
        onPressed: null,
        backgroundColor: Colors.blueAccent.withOpacity(0.8),
        label: Text(
          "Add to Cart",
          style: TextStyle(
            fontSize: 15,
            color: Colors.white,
          ),
        ),
      ),*/
      appBar: AppBar(
        backgroundColor: cardColor,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: SvgPicture.asset(
              "assets/cart.svg",
              color: Colors.white,
            ),
            onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CartInterface()
                  )
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: MyDecoration().backgroundDecoration(),
              child: SingleChildScrollView(
                  child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Wrap(
                        direction: Axis.vertical,
                        children: <Widget>[
                          SizedBox (height: 10),
                          Container(
                            width: MediaQuery.of(context).size.width - 30,
                            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                            decoration: MyDecoration().modelBoxDecoration(),
                            child: Wrap(
                              direction: Axis.vertical,
                              children: <Widget>[
                                FutureBuilder(
                                  future: FirebaseStorageService().getImage(context, product.imgName),
                                  builder: (context, snapshot){
                                    return Container(
                                      padding: EdgeInsets.symmetric(horizontal: 12),
                                      child: snapshot.data,
                                      /*Image.asset(
                                        product.imgName,
                                        fit: BoxFit.cover,
                                      ),*/
                                    );
                                  },
                                ),
                                SizedBox (height: 10,),
                                Text(product.productName,
                                  style: TextStyle(
                                    color: Colors.amberAccent,
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text("Store", style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 25
                                ),),
                                SizedBox(height: 10,),
                                Row(
                                  children: <Widget>[
                                    StarRating(rating: product.rating,),
                                    SizedBox (width: 5,),
                                    Text(
                                      "(" + product.numberOfRating.toString() + ")",
                                      style: TextStyle(
                                        color: Colors.white60,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Text(product.priceInVND.toString() + "VND", style: TextStyle(
                                  color: importanceRed,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox (height: 15,),
                          Text(
                            "About this Game:",
                            style: MyTextStyle().cardTextStyle(),
                          ),
                          SizedBox (height: 15,),
                          Container(
                            width: MediaQuery.of(context).size.width - 30,
                            height: 300,
                            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                            decoration: MyDecoration().modelBoxDecoration(),
                            child: SingleChildScrollView(
                              child: Text(
                                '''$testcase''',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                          SizedBox (height: 15,),
                          Text(
                            "System Requirement:",
                            style: MyTextStyle().cardTextStyle(),
                          ),
                          SizedBox (height: 15,),
                          Container(
                            width: MediaQuery.of(context).size.width - 30,
                            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                            decoration: MyDecoration().modelBoxDecoration(),
                            child: Wrap(
                              direction: Axis.vertical,
                              crossAxisAlignment: WrapCrossAlignment.start,
                              children: <Widget>[
                                Text(
                                  "MINIMUM:",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white70,
                                  ),
                                ),
                                Text("OS:",
                                  style: MyTextStyle().requirementTextStyle(),),
                                Text("Processor:",
                                  style: MyTextStyle().requirementTextStyle(),),
                                Text("Memory:",
                                  style: MyTextStyle().requirementTextStyle(),),
                                Text("Grapics:",
                                  style: MyTextStyle().requirementTextStyle(),),
                                Text("Storage:",
                                  style: MyTextStyle().requirementTextStyle(),),
                                SizedBox (height: 10,),
                                Text(
                                  "RECOMMENDED:",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white70,
                                  ),
                                ),
                                Text("OS:",
                                  style: MyTextStyle().requirementTextStyle(),),
                                Text("Processor:",
                                  style: MyTextStyle().requirementTextStyle(),),
                                Text("Memory:",
                                  style: MyTextStyle().requirementTextStyle(),),
                                Text("Grapics:",
                                  style: MyTextStyle().requirementTextStyle(),),
                                Text("Storage:",
                                  style: MyTextStyle().requirementTextStyle(),),
                              ],
                            ),
                          ),
                          SizedBox (height: 75,),
                        ],
                      )
                  )
              ),
            ),
            Positioned(
              child: GestureDetector(
                onTap: (){
                  this.setState(() {
                    _addToCart = 'Added';
                    CartItemChange().cartAddItem(product);
                  });



                  Timer(Duration(seconds: 1), (){
                    this.setState(() {
                      _addToCart = 'Add to Cart';
                    });
                  });

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
                    _addToCart,
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
            )
          ],
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




  /*
final ProductModel product;

ProductView({this.product});


@override
Widget build(BuildContext context) {
  return Scaffold(
    floatingActionButton: FloatingActionButton.extended(
      onPressed: null,
      backgroundColor: Colors.blueAccent.withOpacity(0.8),
      label: Text(
        "Add to Cart",
        style: TextStyle(
          fontSize: 15,
          color: Colors.white,
        ),
      ),
    ),
    appBar: AppBar(
      backgroundColor: cardColor,
      elevation: 0,
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset(
            "assets/cart.svg",
            color: Colors.white,
          ),
          onPressed: (){
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CartInterface()
                )
            );
          },
        ),
      ],
    ),
    body: SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: MyDecoration().backgroundDecoration(),
        child: SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Wrap(
                  direction: Axis.vertical,
                  children: <Widget>[
                    SizedBox (height: 10),
                    Container(
                      width: MediaQuery.of(context).size.width - 30,
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                      decoration: MyDecoration().modelBoxDecoration(),
                      child: Wrap(
                        direction: Axis.vertical,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: Image.asset(
                              product.imgUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox (height: 10,),
                          Text(product.productName,
                            style: TextStyle(
                              color: Colors.amberAccent,
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text("Store", style: TextStyle(
                              color: Colors.white70,
                              fontSize: 25
                          ),),
                          SizedBox(height: 10,),
                          Row(
                            children: <Widget>[
                              StarRating(rating: product.rating,),
                              SizedBox (width: 5,),
                              Text(
                                "(" + product.numberOfRating.toString() + ")",
                                style: TextStyle(
                                  color: Colors.white60,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Text(product.priceInVND.toString() + "VND", style: TextStyle(
                            color: importanceRed,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox (height: 15,),
                    Text(
                      "About this Game:",
                      style: cardTextStyle(),
                    ),
                    SizedBox (height: 15,),
                    Container(
                      width: MediaQuery.of(context).size.width - 30,
                      height: 300,
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                      decoration: MyDecoration().modelBoxDecoration(),
                      child: SingleChildScrollView(
                        child: Text(
                          '''$testcase''',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    SizedBox (height: 15,),
                    Text(
                      "System Requirement:",
                      style: cardTextStyle(),
                    ),
                    SizedBox (height: 15,),
                    Container(
                      width: MediaQuery.of(context).size.width - 30,
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                      decoration: MyDecoration().modelBoxDecoration(),
                      child: Wrap(
                        direction: Axis.vertical,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        children: <Widget>[
                          Text(
                            "MINIMUM:",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white70,
                            ),
                          ),
                          Text("OS:",
                            style: requirementTextStyle(),),
                          Text("Processor:",
                            style: requirementTextStyle(),),
                          Text("Memory:",
                            style: requirementTextStyle(),),
                          Text("Grapics:",
                            style: requirementTextStyle(),),
                          Text("Storage:",
                            style: requirementTextStyle(),),
                          SizedBox (height: 10,),
                          Text(
                            "RECOMMENDED:",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white70,
                            ),
                          ),
                          Text("OS:",
                            style: requirementTextStyle(),),
                          Text("Processor:",
                            style: requirementTextStyle(),),
                          Text("Memory:",
                            style: requirementTextStyle(),),
                          Text("Grapics:",
                            style: requirementTextStyle(),),
                          Text("Storage:",
                            style: requirementTextStyle(),),
                        ],
                      ),
                    ),
                    SizedBox (height: 50,),
                  ],
                )
            )
        ),
      ),
    ),
  );
}

/*
  BoxDecoration cardBoxDecoration() {
    return BoxDecoration(
                      border: Border.all(
                        color: Color(0xff2778ff).withOpacity(0.1),
                        width: 2,
                      ),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          offset: Offset(1.0, 1.0),
                          blurRadius: 15.0,
                          color: Colors.black87.withOpacity(0.2),
                        ),
                      ],
                    );
  }*/

TextStyle requirementTextStyle() {
  return TextStyle(
    color: Colors.white70,
    fontSize: 15,
  );
}
TextStyle cardTextStyle() {
  return TextStyle(
    color: Colors.white,
    fontSize: 25,
    fontWeight: FontWeight.bold,
  );
}

}

*/