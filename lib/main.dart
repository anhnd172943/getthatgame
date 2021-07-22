import 'package:flutter/material.dart';
import 'package:get_that_game/models/user_model.dart';
import 'package:get_that_game/services/auth.dart';
import 'package:get_that_game/views/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModel>.value(
      value: AuthService().user,

      child: MaterialApp(
        title: 'FlutterDemo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: Home(),
      ),
    );
  }

}

/*

class MyHomePage extends StatefulWidget{
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: MyDecoration().backgroundDecoration(),
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                // Search Bar
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        offset: Offset(5.0, 5.0),
                        blurRadius: 5.0,
                        color: Colors.black87.withOpacity(0.05),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 9),
                        child: Text("Search", style: TextStyle(
                            color: Color(0xff9B9B9B),
                            fontSize: 17
                        ),),
                      ),
                      Spacer(),
                      Icon(Icons.search),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                // Trending

                /*Container(
                padding: EdgeInsets.symmetric(horizontal: 22),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text("Today Trending", style: TextStyle(
                        color: Colors.white,
                        fontSize: 22
                    ),),
                    SizedBox(width: 12,),
                    Text("30 June",
                    style: TextStyle(
                      color: Colors.white70
                    ),)
                  ],
                ),
              ),
              SizedBox(height: 15,),
              Container(
                padding: EdgeInsets.only(left: 22),
                height: 150,
                child: ListView.builder(
                  itemCount: trendingProducts.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index)
                  => TrendingTitle(
                    product: products[index],
                    press: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductView(
                            product: products[index],
                          )
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20,), */

                //Best Selling
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                        "Best Selling",
                        style: MyTextStyle().cardTextStyle()
                    ),
                    SizedBox(width: 12,),
                    Text("This week",
                      style: TextStyle(
                          color: Colors.white70
                      ),)
                  ],
                ),
                SizedBox(height: 15,),
                Container(
                  decoration: MyDecoration().modelBoxDecoration(),
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height - 300,
                  width: MediaQuery.of(context).size.width - 30,
                  child:  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                      child: GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.70,
                            mainAxisSpacing: 12,
                            crossAxisSpacing: 12,
                          ),
                          itemCount: 6,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index){
                            return ProductTitle(
                              product: products[index],
                              press: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProductView(
                                        product: products[index],
                                      )
                                  )
                              ),
                            );
                          }
                      ),
                    ),
                  ),
                ),

                SizedBox (height: 15,),
              //Top categorie
                Text(
                  "Top categories",
                  style: MyTextStyle().cardTextStyle(),
                ),
                SizedBox(height: 15,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                  decoration: MyDecoration().modelBoxDecoration(),
                  width: MediaQuery.of(context).size.width - 30,
                  height: 120,
                  child: ListView.builder(
                    itemCount: categories.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index){
                      return CategorieTitle(
                        categorieName: categories[index].categorieName,
                        imgAssetPath: categories[index].imgAssetPath,
                        color: categories[index].color,
                      );
                    }),
              )

              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
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
        )
      ],
    );
  }

  List<TrendingProductModel> trendingProducts = new List();
  List<ProductModel> products = new List();
  List<CategorieModel> categories = new List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    trendingProducts = getTrendingProducts();
    products = getProducts();
    categories = getCategories();
  }

}




//Card


class TrendingTitle extends StatelessWidget{
  final product;
  final Function press;

  TrendingTitle({this.product, this.press});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: MediaQuery.of(context).size.width-70,
      margin: EdgeInsets.only(right: 13),
      decoration: MyDecoration().modelBoxDecoration(),
      child: Row(
        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Image.asset(product.imgUrl, height: 150, fit: BoxFit.fitWidth,),
                Container(
                  height: 30,
                  width: 80,
                  margin: EdgeInsets.only(left: 5, top: 5),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: barColor.withOpacity(0.8)
                  ),
                  child: Text(product.priceInVND.toString()+"VND", style: TextStyle(
                      color: Colors.white
                  ),
                  ),
                )
              ],
            ),
          ),
          Container(
            width: 160,
            padding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(product.productName, style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                ),
                  overflow: TextOverflow.fade,
                ),
                Text("Store", style: TextStyle(
                    color: Colors.white70
                ),
                ),
                SizedBox(height: 8,),
                Row(
                  children: <Widget>[
                    StarRating(rating: product.rating,),
                    SizedBox(width: 3,),
                    Text(
                      "("+product.numberOfRating.toString()+")",
                      style: TextStyle(
                        color: Colors.white60,
                        fontSize: 12
                    ),
                    )
                  ],
                ),
                SizedBox(height: 13,),
                GestureDetector(
                  onTap: press,
                  child: Container(
                    height: 30,
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: barColor
                    ),
                    child: Text(
                      "See More",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

}

class StarRating extends StatelessWidget{
  final int rating;
  StarRating({this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
       children: <Widget>[
         Image.asset(rating >= 1? "assets/star.png" : "assets/stargrey.png",width: 13,height: 13,),
         SizedBox(width: 3,),
         Image.asset(rating >= 2? "assets/star.png" : "assets/stargrey.png",width: 13,height: 13,),
         SizedBox(width: 3,),
         Image.asset(rating >= 3? "assets/star.png" : "assets/stargrey.png",width: 13,height: 13,),
         SizedBox(width: 3,),
         Image.asset(rating >= 4? "assets/star.png" : "assets/stargrey.png",width: 13,height: 13,),
         SizedBox(width: 3,),
         Image.asset(rating >= 5? "assets/star.png" : "assets/stargrey.png",width: 13,height: 13,),
       ],
    );
  }

}

class ProductTitle extends StatelessWidget {
  final product;
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
          crossAxisAlignment: WrapCrossAlignment.center,
          direction: Axis.vertical,
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  Image.asset(product.imgUrl ,height: 150,fit: BoxFit.cover,) ,
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

class CategorieTitle extends StatelessWidget {
  final String categorieName;
  final String imgAssetPath;
  final String color;
  CategorieTitle({this.imgAssetPath,this.color,this.categorieName});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: cardColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 65,
            width: 110,
            margin: EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8)
            ),
            padding: const EdgeInsets.symmetric(vertical: 14,horizontal: 8),
            child: Container(
                child: Image.asset(imgAssetPath,)),
          ),
          SizedBox(height: 8,),
          Text(
              categorieName,
            style: TextStyle(
              color: Colors.white70
            ),
          ),
        ],
      ),
    );
  }
}


 */