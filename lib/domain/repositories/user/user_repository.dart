import 'package:car_ticket/domain/models/user/model.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class UserRepository {
  Stream<User?> get user;

  Future<void> signInWithEmailAndPassword(String email, String password);

  Future<MyUser> signUpWithEmailAndPassword(MyUser myUser, String password);

  Future<void> signOut();

  Future<void> setUserData(MyUser user);
}
