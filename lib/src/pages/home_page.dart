part of app;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthBloc bloc = AuthBloc();

  _authenticate() async {
    await authWithBiometric();
  }

  _authWithPass() async {
    bool result = await _showSelecctionPage();
    _changeText(result);
  }

  Future<Null> authWithBiometric() async {
    try {
      bool result = await LocalAuthentication().authenticateWithBiometrics(
        localizedReason: 'Scan your fingerprint to authenticate',
        useErrorDialogs: true,
      );

      _changeText(result);
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;
  }

  _changeText(bool result) {
    bloc.changeAuthState(result == null ? false : result);
  }

  Future<bool> _showSelecctionPage() async {
    // final result = GeneralNavigator(context, SelectionPage()).navigate();
    final bool result = await Navigator.push(
      this.context,
      MaterialPageRoute(builder: (context) => SelectionPage()),
    );

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return AuthBlocProvider(
      bloc: bloc,
      child: ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 180.0),
              child: AuthStream(),
            ),
            buildRaiseButton('Biometric Authentication', () => _authenticate()),
            buildRaiseButton('Password Authentication', () => _authWithPass()),
          ],
        ),
      ),
    );
  }

  Container buildRaiseButton(String text, VoidCallback funtion) {
    return Container(
      child: FlatButton(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 20.0,
            decoration: TextDecoration.underline,
          ),
        ),
        onPressed: funtion,
      ),
    );
  }
}
