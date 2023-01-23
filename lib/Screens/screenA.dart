import 'package:flutter/material.dart';
import 'package:intern_assingment/Screens/screenB.dart';
import 'package:intern_assingment/Screens/screenC.dart';
import '../model/catagory.dart';

class ScreenA extends StatelessWidget {
  final List<Category> _categories;
  const ScreenA({super.key, required List<Category> categories})
      : _categories = categories;

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Parent Categories"),
      ),
      body: ListView.builder(
        itemCount: _categories.where((category) => category.parent == 0).length,
        itemBuilder: (context, index) {
          final category = _categories
              .where((category) => category.parent == 0)
              .toList()[index];
          return ListTile(
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ScreenC(category),
                  ),
                );
              }
            },
            trailing: Icon(Icons.navigate_next),
          );
        },
      ),
    );
  }
}
