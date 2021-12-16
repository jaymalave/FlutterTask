import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: const [
           Padding(
             padding: EdgeInsets.all(8.0),
             child: Center(child: Text('This is the home page')),
           ),
        ],
      ),
    );
  }
}
