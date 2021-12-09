import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:untitled/api.dart';
import 'Charactor.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Screens(),
    );
  }
}
class Screens extends StatefulWidget {
  const Screens({Key? key}) : super(key: key);
  @override
  _ScreensState createState() => _ScreensState();
}
class _ScreensState extends State<Screens> {
  Character displayData = Character(Name("","",""), 0, "", [],  Education("",""));
  void getCharacterfromApi() async {
    CharacterApi.getCharacter().then((response) {
      setState(() {
        print(json.decode(response.body));
        displayData = Character.fromJson(json.decode(response.body));
      });
    });
  }
  @override
  void initState() {
    super.initState();
    getCharacterfromApi();
  }
  _filterData(var value) {
    if (value == "N\/A" || value == "" || value == "-") {
      return "Unsupported Charactor";
    } else {
      return value.toString();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          displayItem("First Name:", displayData.name.first),
          displayItem("Middle Name:", displayData.name.middle),
          displayItem("Last Name:", displayData.name.last),
          displayItem("Age:", displayData.age),
          displayItem("Dob:", displayData.DOB),
          hobbiUI("hobbies:", displayData.hobbies),
          displayItem("highschool:", displayData.education.highschool),
          displayItem("college:", displayData.education.college),
        ],
      ),
    );
  }
  Widget displayItem(String title, var value) {
    return Row(
      children: [
        SizedBox(
          width: 25,
        ),
        Text(title),
        SizedBox(
          width: 25,
        ),
        Text(_filterData(value)),
      ],
    );
  }
  Widget hobbiUI(String title, List value) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(title),
      Row(
        children: value.map((e) {
          return Padding(
              padding: EdgeInsets.only(right: 10), child: Text(_filterData(e)));
        }).toList(),
      ),
    ]);
  }
}
