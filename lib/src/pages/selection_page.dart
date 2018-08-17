part of app;

class SelectionPage extends StatelessWidget {
  final Color primaryColor;
  final Color backgroundColor;
  final AssetImage backgroundImage;

  SelectionPage({
    Key key,
    this.primaryColor,
    this.backgroundColor,
    this.backgroundImage,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        SystemChannels.textInput.invokeMethod('TextInput.hide');
      },
      child: new Scaffold(
        body: Center(
          child: ListView(
            children: <Widget>[
              Container(
                padding:
                    const EdgeInsets.only(top: 250.0, left: 20.0, right: 20.0),
                child: Column(
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Full Name',
                        hintText: 'eg. Cosme Fulanito',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 100.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          flatButton(context, 'Confirm', Icons.done, true),
                          flatButton(context, 'Cancel', Icons.cancel, false),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  flatButton(BuildContext context, String text, IconData icon, bool value) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      child: FlatButton.icon(
        label: Text(
          text,
          style: TextStyle(color: this.backgroundColor),
        ),
        icon: Icon(
          icon,
          color: this.backgroundColor,
        ),
        color: this.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0 / 2)),
          side: BorderSide(width: 1.0, color: this.primaryColor),
        ),
        onPressed: () {
          Navigator.pop(context, value);
        },
      ),
    );
  }
}
