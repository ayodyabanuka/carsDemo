import 'package:cars_app/model/car.dart';
import 'package:cars_app/provider/carDetailsProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SingleCarDetails extends StatefulWidget {
  SingleCarDetails({Key? key}) : super(key: key);

  @override
  _SingleCarDetailsState createState() => _SingleCarDetailsState();
}

class _SingleCarDetailsState extends State<SingleCarDetails> {
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
                    itemCount: 1,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        padding:
                            EdgeInsets.only(top: 10, bottom: 10, right: 20),
                        child: Column(
                          children: [
                            Text(context.read<carProvider>().getSingleCarName(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w700))
                          ],
                        ),
                      );
                    });
              }
            }));
  }
}
