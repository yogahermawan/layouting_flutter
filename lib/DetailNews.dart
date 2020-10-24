import 'package:layouting/ApiService/ApiLauwba.dart';
import 'package:layouting/ApiService/ListBeritaResponse.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailNews extends StatefulWidget {
  DetailNews({this.data});

  final Data data;

  @override
  State<StatefulWidget> createState() {
    return _DetailNewsState();
  }
}

class _DetailNewsState extends State<DetailNews> {
  String judul = "",
      postOn = "",
      ketNews = "",
      foto = "https://www.freeiconspng.com/uploads/no-image-icon-15.png";

  void _getDetail() async {
    Api.getDetailNews(widget.data.id).then((response) {
      setState(() {
        judul = response.jdl_news;
        postOn = response.post_on;
        ketNews = response.ket_news;
        foto = response.foto_news;
        print(foto);
      });
    });
  }

  @override
  void initState() {
    _getDetail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Berita"),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Text(
                judul,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              Text(
                postOn,
                style: TextStyle(fontSize: 12),
              ),
              SizedBox(
                height: 10.0,
              ),
              Image.network(
                foto,
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
              SizedBox(
                height: 10.0,
              ),
              Text(ketNews)
            ],
          ),
        ),
      ),
    );
  }
}