library app;

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:flutter/services.dart';

part 'models/auth/auth.dart';
part 'models/auth/auth_bloc.dart';
part 'models/auth/auth_provider.dart';
part 'pages/home_page.dart';
part 'navigators/navigator.dart';
part 'widgets/auth_stream_widget.dart';
part 'widgets/system_padding_widget.dart';
part 'widgets/home_dialog_widget.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String _title = 'Auth Example';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: SafeArea(
            child: Text(_title),
          ),
        ),
        body: HomePage(),
      ),
    );
  }
}
