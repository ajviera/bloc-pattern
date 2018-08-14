part of app;

class LoginNavigator {
  LoginNavigator({Key key, BuildContext context}) {
    _navigate(context);
  }

  void _navigate(BuildContext context) {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomePage()));
  }
}