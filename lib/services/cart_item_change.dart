
import 'package:get_that_game/models/product_model.dart';
import 'package:get_that_game/services/database.dart';

class CartItemChange{

  Future cartAddItem(ProductModel product) async {
    await DatabaseService().updateCartData(product);
  }


}