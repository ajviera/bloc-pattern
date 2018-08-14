part of app;

class AuthBloc {
  final additionController = StreamController<Auth>();
  final authController = StreamController<String>();

  Sink<Auth> get sink => additionController.sink;
  Stream<String> get itemCount => authController.stream;

  AuthBloc(Auth auth, String state) {
    additionController.stream.listen(_onAdd(auth, state));
  }

  _onAdd(Auth auth, String state) {
    auth.changeState(state);
    authController.add(auth.authorized);
  }
}
