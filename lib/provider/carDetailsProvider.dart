import 'dart:convert';

import 'package:cars_app/model/car.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class carProvider with ChangeNotifier {
  List<car> carList = [];
  String singleCarid = "";
  String singleCarName = "";
  String singleCarImageURL = "";

  String getSingleCarid() {
    return this.singleCarid;
  }

  void setSingleCarid(String singleCarid) {
    this.singleCarid = singleCarid;
  }

  String getSingleCarName() {
    return this.singleCarName;
  }

  void setSingleCarName(singleCarName) {
    this.singleCarName = singleCarName;
  }

  String getSingleCarImageURL() {
    return this.singleCarImageURL;
  }

  void setSingleCarImageURL(singleCarImageURL) {
    this.singleCarImageURL = singleCarImageURL;
  }

  Future<List<car>> getCarList() async {
    final responseData = await http.get(Uri.parse(
        'https://private-anon-b242a842d4-carsapi1.apiary-mock.com/manufacturers'));
    print(responseData.statusCode);

    if (responseData.statusCode == 200) {
      final data = jsonDecode(responseData.body) as List;
      if (carList.isNotEmpty) {
        return carList;
      } else {
        for (Map<String, dynamic> item in data) {
          var cars = car.fromJson(item);
          carList.add(cars);
        }
        return carList;
      }
    } else {
      return carList;
    }
  }
}
