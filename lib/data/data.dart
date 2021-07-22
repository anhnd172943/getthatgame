

import 'package:get_that_game/models/categorie_model.dart';
import 'package:get_that_game/models/product_model.dart';
import 'package:get_that_game/models/trending_product_model.dart';

List<TrendingProductModel> getTrendingProducts() {

  List<TrendingProductModel> trendingProducts = new List<TrendingProductModel>();
  TrendingProductModel productModel = new TrendingProductModel();

  //1
  productModel.storeName = "Ubisoft";
  productModel.productName = "Far Cry 3";
  productModel.numberOfRating = 1;
  productModel.rating = 4;
  productModel.priceInVND = 75000;
  productModel.imgUrl = "asset/farcry3.png";
  trendingProducts.add(productModel);
  productModel = new TrendingProductModel();
  //2
  productModel.storeName = "Rockstar";
  productModel.productName = "Grand Theft Auto V";
  productModel.numberOfRating = 3;
  productModel.rating = 4;
  productModel.priceInVND = 99000;
  productModel.imgUrl = "assets/gtav.png";
  trendingProducts.add(productModel);
  productModel = new TrendingProductModel();
  //3
  productModel.storeName = "Ubisofe";
  productModel.productName = "Watch Dog";
  productModel.numberOfRating = 3;
  productModel.rating = 4;
  productModel.priceInVND = 30000;
  productModel.imgUrl = "assets/watchdog.png";
  trendingProducts.add(productModel);
  productModel = new TrendingProductModel();
  //4
  productModel.storeName = "Rockstar";
  productModel.productName = "Grand Theft Auto: San Andreas";
  productModel.numberOfRating = 301;
  productModel.rating = 4;
  productModel.priceInVND = 30000;
  productModel.imgUrl = "assets/gtasa.png";
  trendingProducts.add(productModel);
  productModel = new TrendingProductModel();

  return trendingProducts;
}
List<ProductModel> getProducts(){

  List<ProductModel> products = new List();
  ProductModel productModel = new ProductModel();

  //1
  productModel.productName = "Grand Theft Auto V";
  productModel.numberOfRating = 8;
  productModel.imgName = "";
  productModel.rating = 5;
  productModel.priceInVND = 420000;
  productModel.imgName = "assets/gtav.png";
  products.add(productModel);
  productModel = new ProductModel();
  //2
  productModel.productName = "The Witcher 3";
  productModel.numberOfRating = 6;
  productModel.imgName = "";
  productModel.rating = 5;
  productModel.priceInVND = 175000;
  productModel.imgName = "assets/thewitcher3.png";
  products.add(productModel);
  productModel = new ProductModel();
  //3
  productModel.productName = "Assassin's Creed 2";
  productModel.numberOfRating = 4;
  productModel.imgName = "";
  productModel.rating = 4;
  productModel.priceInVND = 80000;
  productModel.imgName = "assets/ac2.png";
  products.add(productModel);
  productModel = new ProductModel();
  //4
  productModel.productName = "Assassin's Creed";
  productModel.numberOfRating = 4;
  productModel.imgName = "";
  productModel.rating = 4;
  productModel.priceInVND = 50000;
  productModel.imgName = "assets/ac2.png";
  products.add(productModel);
  productModel = new ProductModel();
  //5
  productModel.productName = "Grand Theft Auto IV";
  productModel.numberOfRating = 4;
  productModel.imgName = "";
  productModel.rating = 4;
  productModel.priceInVND = 200000;
  productModel.imgName = "assets/gtav.png";
  products.add(productModel);
  productModel = new ProductModel();
  //6
  productModel.productName = "Far Cry 3";
  productModel.numberOfRating = 4;
  productModel.imgName = "";
  productModel.rating = 4;
  productModel.priceInVND = 20000;
  productModel.imgName = "assets/farcry3.png";
  products.add(productModel);
  productModel = new ProductModel();
  return products;
}
List<CategorieModel> getCategories(){

  List<CategorieModel> categories = new List();
  CategorieModel categorieModel = new CategorieModel();

  //1
  categorieModel.categorieName = "Action Game";
  categorieModel.color= "0xff8EA2FF";
  categorieModel.imgAssetPath = "";
  categories.add(categorieModel);
  categorieModel = new CategorieModel();

  //2
  categorieModel.categorieName = "Simulator Game";
  categorieModel.color = "0xff50F9B4";
  categorieModel.imgAssetPath = "";
  categories.add(categorieModel);
  categorieModel = new CategorieModel();

  //3
  categorieModel.categorieName = "Open World Game";
  categorieModel.color = "0xffFFB397";
  categorieModel.imgAssetPath = "";
  categories.add(categorieModel);
  categorieModel = new CategorieModel();


  return categories;
}

List<ProductModel> getCartProducts(){
  List<ProductModel> carts = new List();
  ProductModel cartProduct = new ProductModel();

  cartProduct.productName = "Grand Theft Auto V";
  cartProduct.priceInVND = 420000;
  cartProduct.imgName = "assets/gtav.png";
  carts.add(cartProduct);
  cartProduct = new ProductModel();
  //2
  cartProduct.productName = "The Witcher 3";
  cartProduct.priceInVND = 175000;
  cartProduct.imgName = "assets/thewitcher3.png";
  carts.add(cartProduct);
  cartProduct = new ProductModel();
  //3
  cartProduct.productName = "Assassin's Creed 2";
  cartProduct.priceInVND = 80000;
  cartProduct.imgName = "assets/ac2.png";
  carts.add(cartProduct);
  cartProduct = new ProductModel();

  return carts;
}