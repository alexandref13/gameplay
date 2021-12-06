import 'package:firebase_auth/firebase_auth.dart';
import 'package:gameplay/app/shared/auth/repositories/auth_repository_interface.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository implements IAuthRepository {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth? _auth = FirebaseAuth.instance;

  @override
  Future<User> getGoogleLogin() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth!.accessToken,
      idToken: googleAuth.idToken,
    );

    final User? user = (await _auth!.signInWithCredential(credential)).user;

    return user!;
  }

  @override
  Future getUser() async {
    User? user;
    if (_auth!.currentUser != null) {
      user = _auth!.currentUser;
      return user!;
    }
  }

  @override
  Future getLogout() async {
    await _auth!.signOut();
  }
}
