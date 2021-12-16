import 'package:flutter/material.dart';
import 'package:flutter_task/utils/colors.dart';
import 'package:anim_search_bar/anim_search_bar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static const Map<String, String> carsDataMap = {
    '0': 'Mercedes',
    '1': 'Lamborghini',
    '2': 'McLaren',
    '3': 'Bentley',
    '4': 'Audi',
    '5': 'BMW',
    '6': 'Jaguar',
    '7': 'RollsRoyce',
    '8': 'Porsche',
  };

  Map<String, String> carsData = Map.from(carsDataMap);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: TextField(
                onSubmitted: (textFieldValue) {
                  textFieldValue.isEmpty
                      ? carsData = carsDataMap
                      : carsData.containsValue(textFieldValue)
                          ? carsData.removeWhere(
                              (key, value) => value != textFieldValue)
                          : carsData = {};
                  setState(() {});
                },
                style: const TextStyle(
                  fontSize: 15.0,
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  prefixIcon: const Icon(Icons.search),
                  hintText: "Search a Car",
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white70, width: 1.0),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemCount: carsData.length,
                itemBuilder: (BuildContext ctx, index) {
                  return Container(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(carsData.values.elementAt(index)),
                        Center(
                          child: Image(
                            image: AssetImage(
                                'assets/images/${carsData.values.elementAt(index)}.png'),
                            height: 75,
                          ),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: AppPallete.primary,
                        borderRadius: BorderRadius.circular(15)),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
