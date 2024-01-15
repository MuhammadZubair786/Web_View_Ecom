import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      
      child: Scaffold(
        backgroundColor: Colors.black,
          // appBar: AppBar(
          //   title: Text('Web View Page'),
          // ),
          body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: WebUri(
            'https://xtrendz.co/',
          ), // Replace with your desired URL
        ),
      )),
    );
  }
}
