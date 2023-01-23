import 'package:flutter/material.dart';
import 'package:intern_assingment/Screens/screenC.dart';

import '../model/catagory.dart';

class ScreenB extends StatelessWidget {
  final Category parentCategory;
  final List<Category> _categories;
  const ScreenB(this.parentCategory,
      {required List<Category> categories, super.key})
      : _categories = categories;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(parentCategory.name),
      ),
      body: ListView.builder(
        itemCount: _categories
            .where((category) => category.parent == parentCategory.id)
            .length,
        itemBuilder: (context, index) {
          final category = _categories
              .where((category) => category.parent == parentCategory.id)
              .toList()[index];
          return ListTile(
            trailing: const Icon(Icons.navigate_next),
            title: Text(category.name),
            onTap: () {
              if (_categories.any((c) => c.parent == category.id)) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ScreenB(
                              category,
                              categories: _categories,
                            )));
              } else {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ScreenC(category)));
              }
            },
          );
        },
      ),
    );
  }
}
