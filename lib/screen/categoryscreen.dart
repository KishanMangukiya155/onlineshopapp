import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:iconly/iconly.dart';
import 'package:onlineshopapp/model/category_model.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  String _title = "Category";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: Text(_title, style: TextStyle(color: Colors.black54)),
          backgroundColor: Colors.blue,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black54),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(IconlyLight.search),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(IconlyLight.buy),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_vert),
            ),
          ]),
      body: Row(
        children: [
          Container(
            width: 80,
            color: Colors.grey.shade400,
          ),
        ],
      ),
    );
  }
}
