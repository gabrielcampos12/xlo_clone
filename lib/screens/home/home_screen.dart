import 'package:flutter/material.dart';
import 'package:xlo/components/custom_drawer/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Scaffold(
        drawer:CustomDrawer(),
        appBar: AppBar(
          title: Text('A'),
        ),
      ),
    );
  }
}
