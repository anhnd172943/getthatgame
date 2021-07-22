import 'package:get_that_game/models/product_model.dart';

class CartData{

  List<ProductModel> cartItems = new List();
  List<ProductModel> addToCart(ProductModel product){
    cartItems.add(product);
    return cartItems;
  }
  List<ProductModel> deleteFromCart(ProductModel product){
    cartItems.remove(product);
    return cartItems;
  }
}