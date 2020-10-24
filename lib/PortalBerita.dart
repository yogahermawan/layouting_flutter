import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:webview_flutter/webview_flutter.dart';

ProgressDialog pd;

class PortalBerita extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PortalBeritaState();
  }
}

class _PortalBeritaState extends State<PortalBerita> {
  @override
  Widget build(BuildContext context) {
    pd = ProgressDialog(context,
        type: ProgressDialogType.Normal, isDismissible: false);

    return Scaffold(
      appBar: AppBar(
        title: Text("Portal Berita"),
      ),
      body: Container(
        child: WebView(
          initialUrl: "https://jogjaprov.go.id/home",
          onWebViewCreated: (WebViewController c) {
            pd.show();
          },
          javascriptMode: JavascriptMode.unrestricted,
          onPageFinished: (String url) {
            print(url);
            pd.hide();
            // isDismissible: true,
          },
        ),
      ),
    );
  }
}