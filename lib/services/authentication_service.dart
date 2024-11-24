import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String? _email;
  bool? _isAuth;

  // gets
  bool get isAuth => _isAuth ?? false;
  String get email => _email.toString();

  // sets 
  set email(String? email) => _email = email;
  set isAuth(bool auth) => _isAuth = auth;


  /**
   * login 
   * Method to communicate with firebase and create token
   * 
   * @Param String email 
   * @Param String password
   *////
  Future<UserCredential> login(String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(email: email.toString(), password: password.toString());
      // get email from user to reuse
      this.email = credential.user?.email.toString();
      isAuth = true;

      return credential;
    }
    catch(e) {
      rethrow;
    }
  }

  // void test(){
  //   _auth.
  // }

  /**
   * register 
   * Method to create user in authenticator
   * 
   * @Param String email
   * @Param String password
   * 
   *////
  Future<UserCredential> register(String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    }
    catch(e) {
      rethrow;
    }
  }

  /**
   * me 
   * Method to get information in session firebase to manipulate
   *////
  User? me() {
    try {
      return _auth.currentUser;
    }
    catch(e) {
      rethrow;
    }
  }

  /**
   * changePassword 
   * 
   * Method to change password from user 
   * 
   * @Param String newPassword
   *////
  Future<void> changePassword(String email) async {
    try {
      return await _auth.sendPasswordResetEmail(email: email);
    }
    catch(e) {
      rethrow;
    }
  }

  /**
   * logout
   * 
   * Method to logout user and excluded credentials
   *////
  Future<void> logout() async {
    try {
      var out = await _auth.signOut();

      email = null;
      isAuth = false;

      return out;
    }
    catch(e) {
      rethrow;
    }
  }
}