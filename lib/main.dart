import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_ex/screens/home_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: Colors.black)
  );
  runApp(ProviderScope(child: Home()));
}


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: HomeScreen()
    );
  }
}
