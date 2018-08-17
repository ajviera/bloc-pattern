part of app;

class HomePage extends StatefulWidget {
  final Color primaryColor;
  final Color backgroundColor;
  final AssetImage backgroundImage;

  HomePage(
      {Key key, this.primaryColor, this.backgroundColor, this.backgroundImage});
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
    } on PlatformException {}
    if (!mounted) return;
  }

  _changeText(bool result) {
    bloc.changeAuthState(result == null ? false : result);
  }

  Future<bool> _showSelecctionPage() async {
    final result = GeneralNavigator(
        context,
        SelectionPage(
          primaryColor: widget.primaryColor,
          backgroundColor: widget.backgroundColor,
          backgroundImage: widget.backgroundImage,
        )).navigate();
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return AuthBlocProvider(
      bloc: bloc,
      child: buildMainContainer(context),
    );
  }

  Scaffold buildMainContainer(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: widget.backgroundColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            ClipPath(
              clipper: Clipper(),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: widget.backgroundImage,
                    fit: BoxFit.cover,
                  ),
                ),
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: 150.0, bottom: 170.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      'Authentication',
                      style: TextStyle(
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                        color: widget.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 100.0, bottom: 60.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  AuthStream(),
                ],
              ),
            ),
            _buildButton('Biometric', () => _authenticate()),
            _buildButton('Manual', () => _authWithPass()),
            // _buildButton('Extra', () => _openExtraPage()),
          ],
        ),
      ),
    );
  }

  Container _buildButton(String text, VoidCallback funtion) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      // child: Expanded(
      child: FlatButton(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        splashColor: widget.primaryColor,
        color: widget.primaryColor,
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                text,
                style: TextStyle(
                  color: widget.backgroundColor,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            Expanded(
              child: Container(),
            ),
            Transform.translate(
              offset: Offset(15.0, 0.0),
              child: Container(
                padding: const EdgeInsets.all(5.0),
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28.0)),
                  splashColor: widget.backgroundColor,
                  color: widget.backgroundColor,
                  child: Icon(
                    Icons.arrow_forward,
                    color: widget.primaryColor,
                  ),
                  onPressed: funtion,
                ),
              ),
            )
          ],
        ),
        onPressed: funtion,
      ),
    );
  }
}
