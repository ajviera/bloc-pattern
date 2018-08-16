part of app;

class AuthBloc {
  final _isAuth = BehaviorSubject<bool>();
  Stream<bool> get isLoading => _isAuth.stream;

  AuthBloc() {
    changeAuthState(false);
  }

  void changeAuthState(bool state) {
    _isAuth.add(state);
  }

  void dispose() {
    _isAuth.close();
  }
}
