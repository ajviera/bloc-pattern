part of app;

class AuthStream extends StatelessWidget {
  final String authorized = 'Authorized';
  final String notAuthorized = 'Not Authorized';

  @override
  Widget build(BuildContext context) {
    AuthBloc bloc = AuthBlocProvider.of(context).bloc;
    return StreamBuilder<bool>(
      stream: bloc.isLoading,
      initialData: true,
      builder: (context, snapshot) => Column(
            children: <Widget>[
              Text('Current State:'),
              Text(
                "${snapshot.data ? authorized : notAuthorized}",
                style: TextStyle(
                  fontSize: 23.0,
                ),
              ),
            ],
          ),
    );
  }
}
