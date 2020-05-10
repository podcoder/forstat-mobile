import 'package:flutter/material.dart';

class FavoritiesPage extends StatefulWidget {
  FavoritiesPage({Key key}) : super(key: key);

  @override
  _FavoritiesPageState createState() => _FavoritiesPageState();
}

class _FavoritiesPageState extends State<FavoritiesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('favorites Page'),
      ),
    );
  }
}
