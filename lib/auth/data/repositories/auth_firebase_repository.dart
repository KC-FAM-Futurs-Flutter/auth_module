import 'package:auth_module/auth/data/models/auth_dto.dart';
import 'package:auth_module/auth/data/models/auth_response.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthFirebaseRepository {
  Future<AuthResponse> isLoggedCurrentUser() async {
    User? myUser = FirebaseAuth.instance.currentUser;

    if (myUser == null) {
      final myResponse = AuthResponse(
        authDto: null,
        firebaseError: null,
        catchError: null,
        isLogged: false,
      );
      return myResponse;
    } else {
      final myResponse = AuthResponse(
        authDto: AuthDto.fromFirebaseUser(myUser),
        firebaseError: null,
        catchError: null,
        isLogged: true,
      );
      return myResponse;
    }
  }

  Future<AuthResponse> logOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      final myResponse = AuthResponse(
        authDto: null,
        firebaseError: null,
        catchError: null,
        isLogged: false,
      );
      return myResponse;
    } catch (e) {
      final myResponse = AuthResponse(
        authDto: null,
        firebaseError: null,
        catchError: '$e',
        isLogged: true,
      );
      print('$e');
      return myResponse;
    }
  }

  Future<AuthResponse> signInAnonymously() async {
    try {
      UserCredential myUserCredential = await FirebaseAuth.instance
          .signInAnonymously();
      User? myUser = myUserCredential.user;
      final myResponse = AuthResponse(
        authDto: AuthDto.fromFirebaseUser(myUser),
        firebaseError: null,
        catchError: null,
        isLogged: true,
      );
      return myResponse;
    } catch (e) {
      final myResponse = AuthResponse(
        authDto: null,
        firebaseError: null,
        catchError: '$e',
        isLogged: false,
      );
      print('$e');
      return myResponse;
    }
  }

  Future<AuthResponse> registerWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential myUserCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      User? myUser = myUserCredential.user;
      final myResponse = AuthResponse(
        authDto: AuthDto.fromFirebaseUser(myUser),
        firebaseError: null,
        catchError: null,
        isLogged: true,
      );
      return myResponse;
    } on FirebaseAuthException catch (e) {
      final myResponse = AuthResponse(
        authDto: null,
        firebaseError: '$e',
        catchError: null,
        isLogged: false,
      );
      print('$e');
      return myResponse;
    } catch (e) {
      final myResponse = AuthResponse(
        authDto: null,
        firebaseError: null,
        catchError: '$e',
        isLogged: false,
      );
      print('$e');
      return myResponse;
    }
  }

  Future<AuthResponse> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential myUserCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      User? myUser = myUserCredential.user;
      final myResponse = AuthResponse(
        authDto: AuthDto.fromFirebaseUser(myUser),
        firebaseError: null,
        catchError: null,
        isLogged: true,
      );
      return myResponse;
    } on FirebaseAuthException catch (e) {
      final myResponse = AuthResponse(
        authDto: null,
        firebaseError: '$e',
        catchError: null,
        isLogged: false,
      );
      print('$e');
      return myResponse;
    } catch (e) {
      final myResponse = AuthResponse(
        authDto: null,
        firebaseError: null,
        catchError: '$e',
        isLogged: false,
      );
      print('$e');
      return myResponse;
    }
  }
}
