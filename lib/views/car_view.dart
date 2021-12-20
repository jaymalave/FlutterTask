import 'package:flutter/material.dart';
import 'package:flutter_task/utils/colors.dart';
import 'package:flutter_task/utils/constants.dart';
import 'package:flutter_task/views/home_page.dart';
import 'package:glassmorphism_buttons/glassmorphism_buttons.dart';

class CarView extends StatelessWidget {
  final String name;

  const CarView({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.bgColor,
      appBar: AppBar(
        title: const Text(Constants.carDetails),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text("This is about car details"),
          Text(
            name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          Center(
            child: Image(
              image: AssetImage('assets/images/$name.png'),
              height: 75,
            ),
          ),

          GlassyButton(
            width: 200,
            title: "Back to Home Page",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
