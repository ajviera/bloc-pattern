part of app;

class Auth {
  bool authenticated = true;

  void changeState() {
    this.authenticated = !authenticated;
  }
}
