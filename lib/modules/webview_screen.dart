import 'package:flutter/material.dart';
import 'package:news_flutter/shared/imports/exports.dart';

class WebViewScreen extends StatelessWidget {

  final String url ;
  WebViewScreen(this.url);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
           onPressed: (){
             Navigator.pop(context);
           },
          icon: const Icon(
            Icons.arrow_back_ios
          ),
        ),
      ),
      body: WebView(
        initialUrl: url,
      ),
    );
  }
}
