part of app;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Auth auth = Auth();
  AuthBloc bloc = AuthBloc();

  _authenticate() async {
    await authWithBiometric();
  }

  _authWithPass() async {
    _showDialog();
    _changeText();
  }

  Future<Null> authWithBiometric() async {
    try {
      await LocalAuthentication().authenticateWithBiometrics(
        localizedReason: 'Scan your fingerprint to authenticate',
        useErrorDialogs: true,
      );

      _changeText();
    } on PlatformException catch (e) {
      print(e);
      _authWithPass();
    }
    if (!mounted) return;
  }

  _changeText() {
    bloc.sink.add(auth);
  }

  _showDialog() async {
    await showDialog<String>(
      context: context,
      builder: (_) => showHomeDialog(context),
    );
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
      child: RaisedButton(
        elevation: 9.0,
        child: const Text('Authenticate'),
        onPressed: () => _authenticate(),
      ),
    );
  }
}
