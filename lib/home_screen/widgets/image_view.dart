import 'package:flutter/material.dart';

class PhotoView extends StatelessWidget {
  final String url;
  PhotoView(this.url);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.black87,
      body: Center(
        child: Hero(
          tag: '$url',
          child: Image.network(url),
        ),
      ),
    );
  }
}
