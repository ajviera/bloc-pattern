part of app;

class GeneralNavigator {
  BuildContext context;
  var page;

  GeneralNavigator(this.context, this.page);

  Future<bool> navigate() async{
    final bool result = await Navigator.push(
      this.context,
      MaterialPageRoute(builder: (context) => this.page),
    );

    return result;
  }
}
