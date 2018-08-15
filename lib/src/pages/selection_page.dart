part of app;

class SelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        SystemChannels.textInput.invokeMethod('TextInput.hide');
      },
      child: Center(
        child: ListView(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 150.0, left: 20.0, right: 20.0),
              child: Column(
                children: <Widget>[
                  TextField(
                    autofocus: true,
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
                        flatButton(
                            context, Text('Cancel'), Icons.cancel, false),
                        flatButton(context, Text('Confirm'), Icons.done, true)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  flatButton(BuildContext context, Text text, IconData icon, bool value) {
    return FlatButton.icon(
      label: text,
      icon: Icon(icon),
      onPressed: () {
        Navigator.pop(context, value);
      },
    );
  }
}
