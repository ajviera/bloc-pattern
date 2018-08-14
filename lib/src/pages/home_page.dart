part of app;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static Auth auth = Auth();
  AuthBloc bloc = AuthBloc(auth, auth.authorized);
  bool authenticated = false;

  _authenticate() async {
    await authWithBiometric();
  }

  _authWithPass() async {
    _showDialog();
    authenticated = true;
    _changeText();
  }

  Future<Null> authWithBiometric() async {
    try {
      authenticated = await LocalAuthentication().authenticateWithBiometrics(
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
    setState(
      () {
        bloc.sink.add(auth);
      },
    );
  }

  _showDialog() async {
    await showDialog<String>(
      context: context,
      builder: (_) => showHomeDialog(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CountBlocProvider(
      bloc: bloc,
      child: ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              'Current State: ${auth.authorized}\n',
              style: TextStyle(fontSize: 20.0),
            ),
            Container(
              height: 50.0,
              width: 150.0,
              child: RaisedButton(
                elevation: 9.0,
                child: const Text('Authenticate'),
                onPressed: () => _authenticate(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
