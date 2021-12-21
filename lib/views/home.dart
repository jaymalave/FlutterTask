import 'package:flutter/material.dart';
import 'package:flutter_task/utils/car_data.dart';
import 'package:flutter_task/utils/colors.dart';
import 'package:flutter_task/utils/constants.dart';
import 'package:flutter_task/views/car_view.dart';
import 'package:flutter_task/views/home_page.dart';
import 'package:flutter_task/views/not_found_view.dart';
import 'package:glassmorphism_buttons/glassmorphism_buttons.dart';
import 'package:toast/toast.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static List<String> carsData = CarData.cdList;

  List<String> searchData = List.from(carsData);

  onItemChanged(String value) {
    setState(() {
      searchData = carsData
          .where((string) => string.toLowerCase().contains(value.toLowerCase()))
          .toList();
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
                onChanged: onItemChanged,
                style: const TextStyle(
                  fontSize: 15.0,
                  color: AppPallete.textLight,
                ),
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  prefixIcon: const Icon(Icons.search, color: AppPallete.textLight,),
                  hintText: "Search a Car",
                    hintStyle: const TextStyle(fontSize: 15.0, color: Colors.white),
                  border: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.white70, width: 0.2),
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
                itemCount: searchData.length,
                itemBuilder: (BuildContext ctx, index) {
                  return SizedBox(
                    height: 500,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                CarView(name: searchData[index]),
                          ),
                        );
                      },
                      child: Card(
                        color: AppPallete.bgColor,
                        shadowColor: Colors.black,
                        elevation: 10,
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
                              Text(searchData[index]),
                              Center(
                                child: Image(
                                  image: AssetImage(
                                      'assets/images/${searchData[index]}.png'),
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
