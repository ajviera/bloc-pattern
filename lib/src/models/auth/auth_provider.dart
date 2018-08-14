part of app;

class AuthBlocProvider extends InheritedWidget {
  final AuthBloc bloc;
  final Widget child;
  AuthBlocProvider({
    this.bloc,
    this.child,
  }) : super(child: child);

  static AuthBlocProvider of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(AuthBlocProvider);
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
}
