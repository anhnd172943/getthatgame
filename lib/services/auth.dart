import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_that_game/models/user_model.dart';
import 'package:get_that_game/services/database.dart';
import 'package:get_that_game/views/register.dart';
import 'package:provider/provider.dart';

class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;


  UserModel _userFromFirebaseUser(User user){
    return user != null ? UserModel(uid: user.uid) : null;
  }

  //stream
  Stream<UserModel> get user{
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  //Dang ky email
  Future emailRegister(String myEmail, String myPassword, String myUserName) async {
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: myEmail, password: myPassword);
      User user = result.user;

      await DatabaseService(uid: user.uid).updateUserData(myUserName);

      return _userFromFirebaseUser(user);
    } catch(e){
      print(e.toString());
      return null;
    }
  }

  //Dang nhap email

  Future emailLogin(String myEmail, String myPassword) async {
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: myEmail, password: myPassword);
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch(e){
      print(e.toString());
      return null;
    }
  }


}