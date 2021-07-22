import 'package:flutter/material.dart';
import 'package:get_that_game/models/cardmodels/producttitle.dart';
import 'package:get_that_game/models/product_model.dart';
import 'package:get_that_game/resources/decorate.dart';
import 'package:get_that_game/services/database.dart';
import 'package:provider/provider.dart';
import 'package:get_that_game/views/product_view.dart';

class NewRealeseProductList extends StatefulWidget {
  @override
  _NewRealeseProductListState createState() => _NewRealeseProductListState();
}

class _NewRealeseProductListState extends State<NewRealeseProductList> {
  @override
  Widget build(BuildContext context) {

    final newReleaseGame = Provider.of<List<ProductModel>>(context);

    newReleaseGame.sort((a, b) {
      return b.realeseDate.compareTo(a.realeseDate);
    });

    return Container(
      decoration: MyDecoration().modelBoxDecoration(),
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height - 400,
      width: MediaQuery.of(context).size.width - 30,
      child:  Expanded(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
              ),
              itemCount: 6,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index){
                return ProductTitle(
                  product: newReleaseGame[index],
                  press: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductView(
                            product: newReleaseGame[index],
                          )
                      )
                  ),
                );
              }
          ),
        ),
      ),
    );
  }
}
