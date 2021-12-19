import 'package:flutter/material.dart';
import 'package:flutter_task/utils/car_data.dart';
import 'package:flutter_task/utils/colors.dart';
import 'package:flutter_task/utils/constants.dart';
import 'package:flutter_task/views/car_view.dart';
import 'package:flutter_task/views/home_page.dart';
import 'package:toast/toast.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static Map<String, String> carsDataMap = CarData.cdMap;

  Map<String, String> carsData = Map.from(carsDataMap);

  invalidHandler() {
    carsData = {};
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return Scaffold(
            appBar:
                AppBar(title: const Text("No Car found"), centerTitle: true),
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
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                      );
                    },
                    child: const Text("Go back to Search"),
                  ),
                ),
              ]),
            ),
          );
        });
  }

  @override
  void initState() {
    super.initState();
  }

  final _searchController = TextEditingController();

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
                controller: _searchController,
                onSubmitted: (textFieldValue) {
                  textFieldValue.isEmpty
                      ? carsData = carsDataMap
                      : carsData.containsValue(textFieldValue)
                          ? carsData.removeWhere(
                              (key, value) => value != textFieldValue)
                          : invalidHandler();
                  setState(() {
                    _searchController.clear();
                  });
                },
                style: const TextStyle(
                  fontSize: 15.0,
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  prefixIcon: const Icon(Icons.search),
                  hintText: "Search a Car",
                  border: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.white70, width: 1.0),
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
                    maxCrossAxisExtent: 350,
                    childAspectRatio: 1,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 20),
                itemCount: carsData.length,
                itemBuilder: (BuildContext ctx, index) {
                  return SizedBox(
                    height: 500,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                CarView(name: carsData.values.elementAt(index)),
                          ),
                        );
                      },
                      child: Card(
                        shadowColor: Colors.black,
                        elevation: 5,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: SizedBox(
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
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
