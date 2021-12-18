import 'package:flutter/material.dart';
import 'package:flutter_task/utils/constants.dart';
import 'package:flutter_task/views/home_page.dart';

class CarView extends StatelessWidget {
  final String name;

  const CarView({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Constants.carDetails),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          const Text("This is about car details"),
          Text(name),
          Center(
            child: Image(
              image: AssetImage('assets/images/$name.png'),
              height: 75,
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              },
              child: const Text("Back to Home Page"))
        ],
      ),
    );
  }
}
