import 'package:flutter/material.dart';

class Message extends StatefulWidget {
  @override
  _MessageState createState() => _MessageState();
}

class _MessageState extends State<Message> {
  String _valGender;
  String _valFriends;
  List _listGender = ["Male", "Female"];
  List _myFriends = [
    "Clara",
    "John",
    "Rizal",
    "Steve",
    "Laurel",
    "Bernard",
    "Miechel"
  ];
  @override
  @override
  Widget build(BuildContext context) {
    Widget imageSection = Container(
      child: Image.asset('image'),
    );

    Widget titleSection = Container(
        padding: EdgeInsets.only(top: 16),
        child: Text(
          'Elementors',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ));

    Widget dropDown = Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          DropdownButton(
            hint: Text("Select Your Friends"),
            value: _valFriends,
            items: _myFriends.map((value) {
              return DropdownMenuItem(
                child: Text(value),
                value: value,
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _valFriends = value;
              });
            },
          ),
          DropdownButton(
            hint: Text("Select The Gender"),
            value: _valGender,
            items: _listGender.map((value) {
              return DropdownMenuItem(
                child: Text(value),
                value: value,
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _valGender = value;
              });
            },
          ),
          Text(
            "My friend is $_valFriends, the gender is $_valGender",
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );

    Widget rateSection = Row(
      children: <Widget>[
        Icon(Icons.star, color: Colors.yellow),
        Icon(Icons.star, color: Colors.yellow),
        Icon(Icons.star, color: Colors.yellow)
      ],
    );

    return Scaffold(
        appBar: AppBar(
          title: Text("Mesage"),
        ),
        body: ListView(children: [
          imageSection,
          titleSection,
          rateSection,
          dropDown,
          Container(padding: EdgeInsets.only(bottom: 10))
        ]));
  }
}

// class Message extends StatelessWidget {
//   void friends(value) {
//     setState(() {
//       _valFriends =
//           value; //Untuk memberitahu _valFriends bahwa isi nya akan diubah sesuai dengan value yang kita pilih
//     });
//   }
