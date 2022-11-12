import 'package:flutter/material.dart';
import 'package:textless/textless.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: "Dashboard".text,
        ));
  }
}
