import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:iconly/iconly.dart';
import 'package:onlineshopapp/model/category_model.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({super.key});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  String? _selectedCategroy;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(
            height: 18,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Store For You",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 45,
              child: Row(
                children: [
                  Expanded(
                    child: FirestoreListView(
                      scrollDirection: Axis.horizontal,
                      query: categoryCollection,
                      itemBuilder: (context, snapshot) {
                        Category category = snapshot.data();
                        return Padding(
                          padding: const EdgeInsets.only(right: 7),
                          child: ActionChip(
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2),
                            ),
                            backgroundColor:
                                _selectedCategroy == category.catName
                                    ? Colors.blue.shade900
                                    : Colors.grey,
                            label: Text(
                              category.catName!,
                              style: TextStyle(
                                fontSize: 11,
                                color: _selectedCategroy == category.catName
                                    ? Colors.white
                                    : Colors.black54,
                              ),
                            ),
                            onPressed: () {
                              print(category.catName);
                              setState(() {
                                _selectedCategroy = category.catName;
                              });
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(color: Colors.grey.shade400),
                      ),
                    ),
                    child: IconButton(
                        onPressed: () {}, icon: Icon(IconlyLight.arrow_down)),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
