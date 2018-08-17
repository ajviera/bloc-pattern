library app;

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:flutter/services.dart';
import 'package:rxdart/rxdart.dart';

part 'blocs/auth/auth_bloc.dart';
part 'blocs/auth/auth_provider.dart';
part 'pages/home_page.dart';
part 'pages/selection_page.dart';
part 'navigators/navigator.dart';
part 'utils/clipper.dart';
part 'widgets/auth_stream_widget.dart';
part 'widgets/system_padding_widget.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String _title = 'Bloc & Local Auth Example';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        // appBar: AppBar(
        //   title: SafeArea(
        //     child: Text(_title),
        //   ),
        // ),
        body: HomePage(
          primaryColor: Colors.red.shade300,
          backgroundColor: Colors.white,
          backgroundImage: AssetImage("assets/images/sakura-bloom.jpg"),
        ),
      ),
    );
  }
}
