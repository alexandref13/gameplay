abstract class IAuthRepository {
  Future getUser();
  Future getGoogleLogin();
  Future getLogout();
}
