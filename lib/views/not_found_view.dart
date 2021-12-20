import 'package:flutter/material.dart';
import 'package:flutter_task/utils/colors.dart';
import 'package:flutter_task/views/home_page.dart';
import 'package:glassmorphism_buttons/glassmorphism_buttons.dart';

class NotFound extends StatelessWidget {
  const NotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
            onWillPop: () async => false,
            child: Scaffold(
              backgroundColor: AppPallete.bgColor,
              appBar: AppBar(
                  title: const Text("No Car found"),
                  centerTitle: true,
                  automaticallyImplyLeading: false),
              body: Center(
                child: Column(children: [
                  const SizedBox(
                    height: 100,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Oops, no such car found"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GlassyButton(
                      width: 200,
                      title: "Go back to search",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ),
                        );
                      },
                    ),
                  ),
                ]),
              ),
            ),
          );
  }
}
