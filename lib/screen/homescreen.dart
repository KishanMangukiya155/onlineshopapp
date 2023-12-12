import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:onlineshopapp/Widget/bannerwidget.dart';
import 'package:onlineshopapp/Widget/brandhiglights.dart';
import 'package:onlineshopapp/Widget/category_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40),
        child: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.blue,
          title: Text(
            "Shop App",
            style: TextStyle(color: Colors.white),
          ),
          actions: [IconButton(onPressed: () {}, icon: Icon(IconlyLight.buy))],
        ),
      ),
      body: ListView(children: [
        SearchWidget(),
        SizedBox(height: 10),
        BannerWidget(),
        BrandHighlights(),
        CategoryWidget(),
      ]),
    );
  }
}

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 55,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.fromLTRB(8, 0, 8, 5),
                  hintText: "Search in Shop App",
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(
                    Icons.search,
                    size: 20,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Icon(IconlyLight.info_square, size: 12, color: Colors.white),
                  Text(
                    "100 % Genuine",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  )
                ],
              ),
              Row(
                children: [
                  Icon(IconlyLight.info_square, size: 12, color: Colors.white),
                  Text(
                    "4 - 7 Days Return",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  )
                ],
              ),
              Row(
                children: [
                  Icon(IconlyLight.info_square, size: 12, color: Colors.white),
                  Text(
                    "Trusted Brand",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
