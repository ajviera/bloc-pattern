part of app;

class AuthStream extends StatelessWidget {
  final String authorized = 'Authorized';
  final String notAuthorized = 'Not Authorized';

  @override
  Widget build(BuildContext context) {
    AuthBloc bloc = AuthBlocProvider.of(context).bloc;
    return StreamBuilder<bool>(
      stream: bloc.authState,
      initialData: true,
      builder: (context, snapshot) => Text(
            "Current State: ${snapshot.data ? authorized : notAuthorized}",
            style: Theme.of(context).textTheme.headline,
          ),
    );
  }
}
