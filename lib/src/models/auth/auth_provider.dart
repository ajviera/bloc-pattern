part of app;

class CountBlocProvider extends InheritedWidget {
  final AuthBloc bloc;
  final Widget child;
  CountBlocProvider({
    this.bloc,
    this.child,
  }) : super(child: child);

  static CountBlocProvider of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(CountBlocProvider);
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
}
