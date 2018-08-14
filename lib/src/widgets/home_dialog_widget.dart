part of app;

Widget showHomeDialog(BuildContext context) {
  return AlertDialog(
    contentPadding: const EdgeInsets.all(16.0),
    content: Row(
      children: <Widget>[
        Expanded(
          child: TextField(
            autofocus: true,
            decoration: InputDecoration(
                labelText: 'Full Name', hintText: 'eg. John Smith'),
          ),
        )
      ],
    ),
    actions: <Widget>[
      flatButton(context, Text('CANCEL')),
      flatButton(context, Text('OPEN'))
    ],
  );
}

flatButton(BuildContext context, Text text) {
  return FlatButton(
    child: text,
    onPressed: () {
      Navigator.pop(context);
    },
  );
}
