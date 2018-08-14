part of app;

class SelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pick an option'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: TextField(
                autofocus: true,
                decoration: InputDecoration(
                    labelText: 'Full Name', hintText: 'eg. John Smith'),
              ),
            ),
            flatButton(context, Text('CANCEL'), false),
            flatButton(context, Text('OPEN'), true)
          ],
        ),
      ),
    );
  }

  flatButton(BuildContext context, Text text, bool value) {
    return FlatButton(
      child: text,
      onPressed: () {
        Navigator.pop(context, value);
      },
    );
  }
}
