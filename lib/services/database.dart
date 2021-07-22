import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_that_game/models/product_model.dart';

class DatabaseService{

  final String uid;
  DatabaseService({this.uid});

  final CollectionReference userCollection = FirebaseFirestore.instance.collection('users');
  final CollectionReference gameCollection = FirebaseFirestore.instance.collection('games');
  final CollectionReference cartCollection = FirebaseFirestore.instance.collection('cartsItem');

  Future updateUserData(String userName) async {
    return await userCollection.doc(uid).set({
      'User Name': userName,
    });
  }


  //cart
  Future updateCartData(ProductModel product) async {
    return await cartCollection.doc().set({
      'Product Name': product.productName,
      'Price': product.priceInVND,
      'Image': product.imgName,
    });
  }



  List<ProductModel> _carttListFromSnapShot(QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      return ProductModel(
        productName: doc.data()['Product Name'] ?? '',
        priceInVND: doc.data()['Price'] ?? 0,
        imgName: doc.data()['Image'] ?? 'gtav.png',
      );
    }).toList();
  }

  Stream<List<ProductModel>> get cartsItem {
    return cartCollection.snapshots()
        .map(_carttListFromSnapShot);
  }





  //Gamelist

  List<ProductModel> _productListFromSnapShot(QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      return ProductModel(
        productName: doc.data()['Name'] ?? '',
        storeName: doc.data()['Store'] ?? '',
        rating: doc.data()['Rating'] ?? 5,
        numberOfRating: doc.data()['Rating Number'] ?? 0,
        priceInVND: doc.data()['Price'] ?? 0,
        imgName: doc.data()['Image'] ?? 'gtav.png',
        realeseDate: (doc.data()['Realese Date'] as Timestamp).toDate() ?? '0',
      );
    }).toList();
  }

  Stream<List<ProductModel>> get games{
    return gameCollection.snapshots()
    .map(_productListFromSnapShot);
  }



}



