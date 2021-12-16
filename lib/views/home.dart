import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static const Map<int, String> carsData = {
    0: 'Mercedes',
    1: 'Lamborghini',
    2: 'McLaren',
    3: 'Bentley',
    4: 'Audi',
    5: 'BMW',
    6: 'Jaguar',
    7: 'RollsRoyce',
    8: 'Porsche',
  };

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(

        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(child: Text('This is the home page')),
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
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(15)),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
