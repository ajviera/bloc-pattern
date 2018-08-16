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
      _authWithPass();
    }
    if (!mounted) return;
  }

  _changeText(bool result) {
    bloc.changeAuthState(result == null ? false : result);
  }

  Future<bool> _showSelecctionPage() async {
    final result = GeneralNavigator(context, SelectionPage()).navigate();
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return AuthBlocProvider(
      bloc: bloc,
      child: ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            AuthStream(),
            buildRaiseButton(),
          ],
        ),
      ),
    );
  }

  Container buildRaiseButton() {
    return Container(
      height: 50.0,
      width: 150.0,
      child: FlatButton(
        child: const Text(
          'Authenticate',
          style: TextStyle(
            fontSize: 20.0,
            decoration: TextDecoration.underline,
          ),
        ),
        onPressed: () => _authenticate(),
      ),
    );
  }
}
