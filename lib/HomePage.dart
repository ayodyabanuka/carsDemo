import 'package:cars_app/model/car.dart';
import 'package:cars_app/provider/carDetailsProvider.dart';
import 'package:cars_app/singleCar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<car>> cars;

  @override
  void initState() {
    super.initState();
    cars = context.read<carProvider>().getCarList();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: FutureBuilder<List<car>>(
        future: cars,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return SizedBox(
                height: size.height, child: Center(child: Text("Loading")));
          } else {
            return ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: EdgeInsets.only(top: 10, bottom: 10, right: 20),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            context
                                .read<carProvider>()
                                .setSingleCarName(snapshot.data![index].name);
                            //context.read<carProvider>().setSingleCarImageURL(
                            //snapshot.data![index].imageURL);

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SingleCarDetails()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              children: [
                                /**Image.network(snapshot.data![index].imageURL,
                                    scale: 5, errorBuilder:
                                        (BuildContext context, Object exception,
                                            StackTrace? stackTrace) {
                                  // Appropriate logging or analytics, e.g.
                                  // myAnalytics.recordError(
                                  //   'An error occurred loading "https://example.does.not.exist/image.jpg"',
                                  //   exception,
                                  //   stackTrace,
                                  // );
                                  return Text('😢');
                                }),
                                //Image.network(
                                //snapshot.data![index].imageURL,
                                // scale: 20,
                                //),*/
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(snapshot.data![index].name,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700))
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    margin: EdgeInsets.symmetric(vertical: 10),
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  );
                });
          }
        },
      ),
    );
  }
}
