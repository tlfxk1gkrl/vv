import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(widget.title),
      ),
    );
  }
}
