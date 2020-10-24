import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:layouting/BeritaJson.dart';
import 'package:layouting/Message.dart';
import 'package:layouting/Table.dart';

import 'package:flutter/cupertino.dart';
import 'package:layouting/PortalBerita.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Dashboard'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
                "The Special Region of Yogyakarta (Indonesian: Daerah Istimewa Yogyakarta, pronounced /ˌjɒɡjəˈkɑːrtə/) is a provincial-level autonomous region of Indonesia in the southern Java.[5] "
                "It is bordered by the Indian Ocean to the south, as well as sharing all the land borders to the province of Central Java. Ruled by the Yogyakarta Sultanate, the region is the only officially recognised monarchy within the government of Indonesia. "
                "The city of Yogyakarta is the capital and the economic center of the region.The Yogyakarta Sultanate has been established since 1755 and provided an unwavering support for Indonesia's independence during the Indonesian National Revolution (1945–1949). "
                "As a first-level division in Indonesia, Yogyakarta is governed by Sultan Hamengkubuwono as the governor and Prince Paku Alam as the vice governor. With a land area of 3,185.8 km², it is the second-smallest province of Indonesia after Jakarta.[6]"),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("graphics/bg.jpg"), fit: BoxFit.fill),
                ),
                currentAccountPicture: CircleAvatar(
                  child: Text("A"),
                  backgroundColor: Colors.white,
                ),
                accountName: Text("Admin"),
                accountEmail: Text("admin@example.com")),
            Container(
              padding: EdgeInsetsDirectional.only(start: 20.0, top: 10.0),
              child: Text("Menu Utama"),
            ),
            ListTile(
              leading: Icon(Icons.dashboard),
              title: Text("Dashboard"),
              onTap: null,
            ),
            ListTile(
              leading: Icon(Icons.web),
              title: Text("Message"),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Message()));
              },
            ),
            ListTile(
              leading: Icon(Icons.map),
              title: Text("Tabel JSON"),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TablePage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.videocam),
              title: Text("Portal Berita"),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PortalBerita()));
              },
            ),
            ListTile(
              leading: Icon(Icons.photo_library),
              title: Text("Galeri Wisata"),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BeritaJson()));
              },
            ),
            Divider(
              color: Colors.grey,
              height: 1,
            ),
            Container(
              padding: EdgeInsetsDirectional.only(start: 20.0, top: 10.0),
              child: Text("Lain-Lain"),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Tentang Pengembang"),
              onTap: null,
            ),
            ListTile(
              leading: Icon(Icons.power_settings_new),
              title: Text("Keluar"),
              onTap: () {
                SystemNavigator.pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}