import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:json_table/json_table.dart';
import 'package:layouting/ApiService/ApiService.dart';

class TablePage extends StatefulWidget {
  @override
  _TablePageState createState() => _TablePageState();
}

class _TablePageState extends State<TablePage> {
    final String jsonSample =
      '[{"equipe1":"PSG","equipe2":"DIJON","type_prono":"1N2"},{"equipe1":"MONACO","equipe2":"REIMS","type_prono":"1N2"},{"equipe1":"TOULOUSE","equipe2":"RENNES","type_prono":"1N2"},{"equipe1":"MONTPELLIER","equipe2":"STRASBOURG","type_prono":"1N2"},{"equipe1":"AMIENS","equipe2":"METZ","type_prono":"1N2"},{"equipe1":"BREST","equipe2":"ANGERS","type_prono":"1N2"},{"equipe1":"LORIENT","equipe2":"CHAMBLY","type_prono":"1N2"}]';
  bool toggle = true;
  ApiService exampleService = ApiService();


  @override
  Widget build(BuildContext context) {
    var json = jsonDecode(jsonSample);
    var daa = exampleService;
    print(daa);
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: toggle
            ? Column(
          children: [
            JsonTable(
              json,
              showColumnToggle: true,
              tableHeaderBuilder: (String header) {
                return Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 4.0),
                  decoration: BoxDecoration(
                      border: Border.all(width: 0.5),
                      color: Colors.grey[300]),
                  child: Text(
                    header,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.display1.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 14.0,
                        color: Colors.black87),
                  ),
                );
              },
              tableCellBuilder: (value) {
                return Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: 4.0, vertical: 2.0),
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 0.5,
                          color: Colors.grey.withOpacity(0.5))),
                  child: Text(
                    value,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.display1.copyWith(
                        fontSize: 14.0, color: Colors.grey[900]),
                  ),
                );
              },
              allowRowHighlight: true,
              rowHighlightColor: Colors.yellow[500].withOpacity(0.7),
              paginationRowCount: 20,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text("Simple table which creates table direclty from json")
          ],
        )
            : Center(
          child: Text(getPrettyJSONString(jsonSample)),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.grid_on),
          onPressed: () {
            setState(
                  () {
                toggle = !toggle;
              },
            );
          }),
    );
  }

  String getPrettyJSONString(jsonObject) {
    JsonEncoder encoder = new JsonEncoder.withIndent('  ');
    String jsonString = encoder.convert(json.decode(jsonObject));
    return jsonString;
  }
}