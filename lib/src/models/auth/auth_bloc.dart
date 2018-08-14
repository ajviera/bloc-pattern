part of app;

class AuthBloc {
  final additionController = StreamController<Auth>();
  final authController = StreamController<bool>();

  Sink<Auth> get sink => additionController.sink;
  Stream<bool> get authState => authController.stream;

  AuthBloc() {
    additionController.stream.listen(onAdd);
  }

  void onAdd(Auth auth) {
    auth.changeState();
    authController.add(auth.authenticated);
  }
}
