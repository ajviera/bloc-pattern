part of app;

class Auth {
  String authorized = 'Not Authorized';

  void changeState(String state) {
    this.authorized = state;
  }
}
