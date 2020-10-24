import 'package:layouting/DetailNews.dart';
import 'package:layouting/ApiService/ApiLauwba.dart';
import 'package:layouting/ApiService/ListBeritaResponse.dart';
import 'package:flutter/material.dart';

class BeritaJson extends StatefulWidget {
  BeritaJson({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _BeritaJsonState createState() => _BeritaJsonState();
}

class _BeritaJsonState extends State<BeritaJson> {
  var listNews = List<ListBeritaResponse>();
  var data = List<Data>();

  void _getnews() async {
    Api.getNews().then((response) {
      setState(() {
        this.data = response.data;
        print(this.data);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _getnews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (BuildContext ctx, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailNews(
                              data: data[index],
                            )));
              },
              child: Card(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Container(
                      width: 65.0,
                      height: 65.0,
                      alignment: Alignment.center,
                      child: Image.network(
                        data[index].fotoNews,
                        fit: BoxFit.cover,
                        width: 120.0,
                        height: 65.0,
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes
                                  : null,
                            ),
                          );
                        },
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.all(5),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(data[index].jdlNews,
                                  maxLines: 2,
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13)),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(data[index].postOn,
                                  maxLines: 2,
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}